//
//  FoodiItemViewController.swift
//  Foodi
//
//  Created 3bdo on 10/9/20.
//
//

import UIKit
import RxSwift
import RxCocoa

class FoodiItemViewController: UIViewController, FoodiItemViewControllerProtocol {

    // MARK: - Outlets
    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var foodNameLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var energyLabel: UILabel!
    @IBOutlet weak var proteinLabel: UILabel!
    @IBOutlet weak var fatLabel: UILabel!
    @IBOutlet weak var chorestolLabel: UILabel!
    @IBOutlet weak var sugarLabel: UILabel!
    
    //MARK: - Attributes
	var presenter: FoodiItemPresenterProtocol?
    let disposeBag = DisposeBag()
    
    // MARK: -  View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.attach()
        setupUI()
    }
    
    func setupUI(){
        guard let foodItem = presenter?.viewModel.foodItem else { return }
        foodImageView.kf.setImage(with: URL(string: foodItem.image ?? ""),
                                  placeholder: UIImage(named: "defaultImage"))
        foodNameLabel.text = foodItem.label
        categoryLabel.text = foodItem.category
        energyLabel.text = "\(foodItem.nutrients?.enercKcal?.description ?? "-")"
        proteinLabel.text = "\(foodItem.nutrients?.procnt?.description ?? "-")"
        fatLabel.text = "\(foodItem.nutrients?.fat?.description ?? "-")"
        chorestolLabel.text = "\(foodItem.nutrients?.chocdf?.description ?? "-")"
        sugarLabel.text = "\(foodItem.nutrients?.sugre?.description ?? "-")"
    }
    
}
