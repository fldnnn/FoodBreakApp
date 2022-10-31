//
//  CartContract.swift
//  FoodBreak
//
//  Created by Fulden Onan on 25.10.2022.
//

import Foundation

protocol ViewToPresenterCartProtocol {
    var cartInteractor: PresenterToInteractorCartProtocol? {get set}
    var cartView: PresenterToViewCartProtocol? {get set}
    
    func viewDidLoad()
    func deleteFood(with sepet_yemek_id: Int)
}

protocol PresenterToInteractorCartProtocol {
    var cartPresenter: InteractorToPresenterCartProtocol? {get set}
    
    func getCartFoods()
    func deleteSelectedFood(with sepet_yemek_id: Int)
    
}

protocol InteractorToPresenterCartProtocol {
    func didDataFecth(with cartFoodList: [SepetYemek])
}

protocol PresenterToViewCartProtocol {
    func updateView(with cartFoodList: [SepetYemek])
}

protocol PresenterToRouterCartProtocol {
    static func createModule(ref: CartViewController)
}
