//
//  DetailFoodPresenter.swift
//  FoodBreak
//
//  Created by Fulden Onan on 24.10.2022.
//

import Foundation

class DetailFoodPresenter: ViewToPresenterDetailProtocol {
    var detailInteractor: PresenterToInteractorDetailProtocol?
    
    func addFood(food: Food, count: Int, username: String) {
        detailInteractor?.addToBasket(food: food, count: count, username: username)
    }    
}
