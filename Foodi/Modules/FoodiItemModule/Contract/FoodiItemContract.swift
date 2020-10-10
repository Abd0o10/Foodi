//
//  FoodiItemContract.swift
//  Foodi
//
//  Created 3bdo on 10/9/20.
//
//

import Foundation
import RxSwift

// MARK: - Router
enum FoodiItemRoute {
}

protocol FoodiItemRouterProtocol: class {
}

// MARK: - Presenter
protocol FoodiItemPresenterProtocol: class {
    func attach()
    var viewModel: FoodiItemViewModel { get }
}

// MARK: - Interactor
protocol FoodiItemInteractorProtocol: class {
}

// MARK: - View
protocol FoodiItemViewControllerProtocol: class {
    
    var presenter: FoodiItemPresenterProtocol? { get set }
}
