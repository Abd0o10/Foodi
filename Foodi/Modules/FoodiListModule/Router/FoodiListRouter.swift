//
//  FoodiListRouter.swift
//  Foodi
//
//  Created 3bdo on 10/9/20.
//
//

import UIKit
import RxSwift

class FoodiListRouter: FoodiListRouterProtocol {
    
    
    //MARK: - Attributes
    weak var viewController: UIViewController?
    
    
    
    //MARK:- Assemple
    static func assembleModule() -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = FoodiListViewController()
        let interactor = FoodiListInteractor()
        let router = FoodiListRouter()
        let presenter = FoodiListPresenter(viewController: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        router.viewController = view
        
        return view
    }
    
    
    //MARK: - Routing
    func go(to route:FoodiListRoute) {
        switch route {
        case .detailsView(let item):
            let itemDetailsVC = FoodiItemRouter.assembleModule(item: item)
            viewController?.present(itemDetailsVC, animated: true, completion: nil)
        }
    }

}
