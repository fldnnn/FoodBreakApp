//
//  Foods.swift
//  FoodBreak
//
//  Created by Fulden Onan on 24.10.2022.
//

import Foundation

struct Foods: Codable{
    let yemekler: [Food]?
    let success: Int?
}

struct Food: Codable {
    let yemek_id: String?
    let yemek_adi: String?
    let yemek_resim_adi: String?
    let yemek_fiyat: String?
}
