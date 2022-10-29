//
//  DetailFoodInteractor.swift
//  FoodBreak
//
//  Created by Fulden Onan on 24.10.2022.
//

import Foundation
import Alamofire

class DetailFoodInteractor:PresenterToInteractorDetailProtocol {
    var cartFoodList = [SepetYemek]()
    
    func addToBasket(food: Food, count: Int, username: String) {
        var sameFood: SepetYemek?
        
        getCartFood(username: username) {
            sameFood = self.hasFood(food: food)
            
            if sameFood != nil {
                let oldCount = sameFood?.yemek_siparis_adet
                let addCount = count
                sameFood?.yemek_siparis_adet = String(Int(oldCount!)! + addCount)
                
                self.deleteFood(foodId: (sameFood?.sepet_yemek_id)!, username: username) {
                    let newFood = Food(yemek_id: nil, yemek_adi: sameFood?.yemek_adi, yemek_resim_adi: sameFood?.yemek_resim_adi, yemek_fiyat: sameFood?.yemek_fiyat)
                    
                    self.addFoodToBasket(food: newFood, count: Int(sameFood!.yemek_siparis_adet!)!, username: (sameFood?.kullanici_adi!)!)
                }
                
                
            }else{
                self.addFoodToBasket(food: food, count: count, username: username)
            }
        }
        
        
    }
    func addFoodToBasket(food: Food, count: Int, username: String) {
        let params: Parameters = ["yemek_adi": food.yemek_adi!, "yemek_resim_adi": food.yemek_resim_adi!, "yemek_fiyat": food.yemek_fiyat!, "yemek_siparis_adet": count, "kullanici_adi": username]
        
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
    
    func deleteFood(foodId: String, username: String, isFinished: @escaping () -> Void) {
        let params: Parameters = ["sepet_yemek_id": foodId, "kullanici_adi": username]
        AF.request("http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php", method: .post, parameters: params).response { response in
            if let data = response.data {
                do{
                    let response = try JSONSerialization.jsonObject(with: data)
                    print(response)
                    isFinished()
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
    func getCartFood(username: String, completion: @escaping () -> Void) {
        let params: Parameters = ["kullanici_adi": username]
        AF.request("http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php", method: .post, parameters: params).response { response in
            if let data = response.data {
                do {
                    let response = try JSONDecoder().decode(CartFoods.self, from: data)
                    print(data)
                    if let list = response.sepet_yemekler {
                        DispatchQueue.main.async {
                            self.cartFoodList = list
                            completion()
                        }
                    }
            }catch{
                print(error.localizedDescription)
                completion()
                }
            }
        }
    }
    
    func hasFood(food: Food) -> SepetYemek? {
        let sameFood = cartFoodList.first {$0.yemek_adi == food.yemek_adi}
        print("here \(sameFood)")
        if sameFood != nil {
            return sameFood!
        }
        return nil
    }
}
