//
//  FoodiListInteractor.swift
//  Foodi
//
//  Created 3bdo on 10/9/20.
//
//

import RxSwift


class FoodiListInteractor: FoodiListInteractorProtocol {
    
    func fetchData(_ foodName: String) -> Observable<[Food]> {
        return NetworkService.shared.fetchRecipe(with: foodName)
    }
}
