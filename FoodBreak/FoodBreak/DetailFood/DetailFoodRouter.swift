//
//  DetailFoodRouter.swift
//  FoodBreak
//
//  Created by Fulden Onan on 24.10.2022.
//

import Foundation

class DetailFoodRouter: PresenterToRouterDetailProtocol {
    static func createModule(ref: DetailFoodViewController) {
        ref.detailPresenterObject = DetailFoodPresenter()
        ref.detailPresenterObject?.detailInteractor = DetailFoodInteractor()
    }
}
