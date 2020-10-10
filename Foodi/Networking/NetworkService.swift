//
//  NetworkService.swift
//  Foodi
//
//  Created by 3bdo on 10/9/20.
//  Copyright © 2020 3bdo. All rights reserved.
//

import Moya
import RxSwift

class NetworkService {
    
    static let shared = NetworkService()
    private let provider = MoyaProvider<RecipeNetworking>()
    
    func fetchRecipe(with query: String) -> Observable<[Food]> {
        
        Observable.create { observable -> Disposable in
            let request = self.provider.request(.searchRecipe(query: query)) { (result) in
                switch result {
                case .success(let response):
                    do {
                        let recipe = try JSONDecoder().decode(Recipe.self, from: response.data)
                        observable.onNext(recipe.hints.compactMap({ $0.food }))
                        observable.onCompleted()
                    } catch(let error) {
                        observable.onError(error)
                    }
                case .failure(let error):
                    observable.onError(error)
                }
            }
            
            return Disposables.create {
                request.cancel()
            }
        }
        
        
    }
}
