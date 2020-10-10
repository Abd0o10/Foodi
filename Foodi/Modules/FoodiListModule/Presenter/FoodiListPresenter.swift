//
//  FoodiListPresenter.swift
//  Foodi
//
//  Created 3bdo on 10/9/20.
//
//

import UIKit
import RxSwift

class FoodiListPresenter: FoodiListPresenterProtocol {
    //MARK: - Attributes
    weak private var viewController: FoodiListViewControllerProtocol?
    var interactor: FoodiListInteractorProtocol?
    private let router: FoodiListRouterProtocol
    private let disposeBag = DisposeBag()
    var viewModel = FoodiListViewModel ()  

    
    
    //MARK:- init
    init(viewController: FoodiListViewControllerProtocol, interactor: FoodiListInteractorProtocol?, router: FoodiListRouterProtocol) {
        self.viewController = viewController
        self.interactor = interactor
        self.router = router
    }
    
    //MARK:- Functions
    func attach() {
        bindViewAction()
        bindFetchingData()
    }
    
    func bindFetchingData() {
        guard let interactor = interactor else { return }
        viewModel
            .fetchFoodData
            .filter({ $0 != nil && $0 != "" })
            .flatMap { name -> Observable<[Food]> in
                return interactor.fetchData(name ?? "")
            }.bind(onNext: { [weak self] recipes in
                self?.viewModel.dataSource.onNext(recipes)
            }).disposed(by: disposeBag)
    }
    
    func bindViewAction() {
        viewModel
            .viewAction
            .filter({ $0 != nil })
            .bind(onNext: { [weak self] action in
                switch action {
                    case .select(let item):
                        self?.router.go(to: .detailsView(item: item))
                    default:
                        break
                }
            }).disposed(by: disposeBag)
    }
}
