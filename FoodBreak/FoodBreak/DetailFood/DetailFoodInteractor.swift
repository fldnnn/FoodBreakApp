//
//  DetailFoodInteractor.swift
//  FoodBreak
//
//  Created by Fulden Onan on 24.10.2022.
//

import Foundation
import Alamofire

class DetailFoodInteractor:PresenterToInteractorDetailProtocol {
    func addToBasket(yemek_adi: String, yemek_resim_adi: String, yemek_fiyat: String, yemek_siparis_adet: String, kullanici_adi: String) {
        let params: Parameters = ["yemek_adi": yemek_adi, "yemek_resim_adi": yemek_resim_adi, "yemek_fiyat": yemek_fiyat, "yemek_siparis_adet": yemek_siparis_adet, "kullanici_adi": kullanici_adi]
        
        AF.request("http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php", method: .post, parameters: params).response { response in
            if let data = response.data {
                do {
                    let response = try JSONSerialization.jsonObject(with: data)
                    print(response)
                }catch{
                    print(error.localizedDescription)
                }
            }
            
        }
    }
}
