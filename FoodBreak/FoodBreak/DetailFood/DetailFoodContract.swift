//
//  DetailFoodContract.swift
//  FoodBreak
//
//  Created by Fulden Onan on 24.10.2022.
//

import Foundation

protocol ViewToPresenterDetailProtocol {
    var detailInteractor: PresenterToInteractorDetailProtocol? {get set}
    
    func addFood(yemek_adi: String, yemek_resim_adi: String, yemek_fiyat: String, yemek_siparis_adet: String, kullanici_adi: String)    
}

protocol PresenterToInteractorDetailProtocol {
    func addToBasket(yemek_adi: String, yemek_resim_adi: String, yemek_fiyat: String, yemek_siparis_adet: String, kullanici_adi: String)
}

protocol PresenterToRouterDetailProtocol {
    static func createModule(ref: DetailFoodViewController)
}
