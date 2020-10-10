//
//  FoodiItemPresenter.swift
//  Foodi
//
//  Created 3bdo on 10/9/20.
//
//

import UIKit
import RxSwift

class FoodiItemPresenter: FoodiItemPresenterProtocol {

    // MARK: - Attributes
    weak private var viewController: FoodiItemViewControllerProtocol?
    var interactor: FoodiItemInteractorProtocol?
    private let router: FoodiItemRouterProtocol
    private let disposeBag = DisposeBag()
    var viewModel :  FoodiItemViewModel

    // MARK: - init
    init(viewController: FoodiItemViewControllerProtocol,
         interactor: FoodiItemInteractorProtocol?,
         router: FoodiItemRouterProtocol,
         viewModel: FoodiItemViewModel) {
        self.viewController = viewController
        self.interactor = interactor
        self.router = router
        self.viewModel = viewModel
    }
    
    // MARK: - Functions
    func attach() {
    }
}
