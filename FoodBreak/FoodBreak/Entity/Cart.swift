//
//  Cart.swift
//  FoodBreak
//
//  Created by Fulden Onan on 25.10.2022.
//

import Foundation

struct CartFoods: Codable {
    let sepet_yemekler: [SepetYemek]?
    let success: Int?
}

struct SepetYemek: Codable {
    let sepet_yemek_id: String?
    let yemek_adi: String?
    let yemek_resim_adi: String?
    let yemek_siparis_adet: String?
    let kullanici_adi: String?
    let yemek_fiyat: String?

}
