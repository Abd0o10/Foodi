//
//  FoodiListViewController.swift
//  Foodi
//
//  Created 3bdo on 10/9/20.
//
//

import UIKit
import RxSwift
import RxCocoa

class FoodiListViewController: UIViewController, FoodiListViewControllerProtocol {

    //MARK: - Outlets
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: - Attributes
	var presenter: FoodiListPresenterProtocol?
    let disposeBag = DisposeBag()
    
    
    //MARK: -  View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.attach()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        setupCollectionViewFlowLayout()
    }
}

// MARK: - Tableview Binding & Setup
extension FoodiListViewController {
    
    func setupUI(){
        setupTableView()
        registerTableViewCell()
        setupCollectionViewFlowLayout()
    }
    
    func setupTableView(){
        bindtableView()
        bindingSearchBar()
    }
    
    func registerTableViewCell() {
        let nib = UINib(nibName: "\(FoodiListCell.self)", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "\(FoodiListCell.self)")
    }
    
    func setupCollectionViewFlowLayout() {
        let flowLayout = UICollectionViewFlowLayout()
        let width = (collectionView.frame.width - 10) / 2.0
        let height = width * 2.0 / 3.0
        flowLayout.itemSize = CGSize(width: width, height: height)
        
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        
        collectionView.setCollectionViewLayout(flowLayout, animated: false)
    }
    
    func bindtableView(){
        bindCollectionViewDataSource()
        bindCollectionViewSelectedCell()
    }
    
    func bindCollectionViewDataSource(){
        presenter?
            .viewModel
            .dataSource
            .bind(to: collectionView.rx.items(cellIdentifier: "\(FoodiListCell.self)", cellType: FoodiListCell.self)) {row, item, cell in
                cell.setup(imageURL: item.image, name: item.label)
                }.disposed(by: disposeBag)
    }
    
    func bindCollectionViewSelectedCell(){
        collectionView.rx.modelSelected(Food.self).subscribe(onNext: { [weak self] item in
            self?.presenter?.viewModel.viewAction.onNext(.select(item: item))
        }).disposed(by: disposeBag)
    }
    
    
    func bindingSearchBar(){
        searchBar.rx.text.subscribe(onNext: { [weak self] text in
            self?.presenter?.viewModel.fetchFoodData.onNext(text)
        }).disposed(by: disposeBag)
    }
}
