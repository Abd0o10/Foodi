//
//  FoodiItemRouter.swift
//  Foodi
//
//  Created 3bdo on 10/9/20.
//
//

import UIKit

class FoodiItemRouter: FoodiItemRouterProtocol {
    
    // MARK: - Attributes
    weak var viewController: UIViewController?
    
    // MARK:- Assemple
    static func assembleModule(item: Food) -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = FoodiItemViewController()
        let interactor = FoodiItemInteractor()
        let router = FoodiItemRouter()
        let viewModel = FoodiItemViewModel(foodItem: item)
        let presenter = FoodiItemPresenter(viewController: view,
                                           interactor: interactor,
                                           router: router,
                                           viewModel: viewModel)
        
        view.presenter = presenter
        router.viewController = view
        
        return view
    }
    
    
    //MARK: - Routing
    func go(to route:FoodiItemRoute) {
        switch route {
        default: break
        }
    }

}
