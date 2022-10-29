//
//  DetailFoodContract.swift
//  FoodBreak
//
//  Created by Fulden Onan on 24.10.2022.
//

import Foundation

protocol ViewToPresenterDetailProtocol {
    var detailInteractor: PresenterToInteractorDetailProtocol? {get set}
    
    func addFood(food: Food, count: Int, username: String)
}

protocol PresenterToInteractorDetailProtocol {
    func addToBasket(food: Food, count: Int, username: String)
}

protocol PresenterToRouterDetailProtocol {
    static func createModule(ref: DetailFoodViewController)
}
