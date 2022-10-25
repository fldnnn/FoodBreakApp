//
//  CartPresenter.swift
//  FoodBreak
//
//  Created by Fulden Onan on 25.10.2022.
//

import Foundation

class CartPresenter: ViewToPresenterCartProtocol {
    var cartInteractor: PresenterToInteractorCartProtocol?
    
    var cartView: PresenterToViewCartProtocol?
    
    func viewDidLoad() {
        cartInteractor?.getCartFoods()
    }
    func deleteFood(with sepet_yemek_id: Int) {
        cartInteractor?.deleteSelectedFood(with: sepet_yemek_id)
    }
}

extension CartPresenter: InteractorToPresenterCartProtocol {
    func didDataFecth(with cartFoodList: [SepetYemek]) {
        cartView?.updateView(with: cartFoodList)
        
    }
}
