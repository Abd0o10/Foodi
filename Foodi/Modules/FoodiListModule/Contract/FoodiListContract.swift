//
//  FoodiListContract.swift
//  Foodi
//
//  Created 3bdo on 10/9/20.
//
//

import Foundation
import RxSwift


// MARK: - Router
enum FoodiListRoute {
    case detailsView(item: Food)
}

protocol FoodiListRouterProtocol: class {
    func go(to route:FoodiListRoute)
}

// MARK: - Presenter
protocol FoodiListPresenterProtocol: class {
    var viewModel: FoodiListViewModel  { get }
    func attach()
}

// MARK: - Interactor
protocol FoodiListInteractorProtocol: class {
    func fetchData(_ foodName: String) -> Observable<[Food]>
}

// MARK: - View
enum FoodiListViewAction {
    case select(item: Food)
}

protocol FoodiListViewControllerProtocol: class {
    var presenter: FoodiListPresenterProtocol?  { get set }
}
