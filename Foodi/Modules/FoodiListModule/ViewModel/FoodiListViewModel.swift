//
//  FoodiListViewModel.swift
//  Foodi
//
//  Created 3bdo on 10/9/20.
//
//

import Foundation
import RxSwift

struct FoodiListViewModel {
    let fetchFoodData = BehaviorSubject<String?>(value: nil)
    let dataSource = BehaviorSubject<[Food]>(value: [])
    let viewAction = PublishSubject<FoodiListViewAction?>()
    let localization =  FoodiListLocalization()
}
