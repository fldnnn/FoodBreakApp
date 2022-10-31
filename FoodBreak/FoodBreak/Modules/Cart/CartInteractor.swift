//
//  CartInteractor.swift
//  FoodBreak
//
//  Created by Fulden Onan on 25.10.2022.
//

import Foundation
import Alamofire
import FirebaseAuth

class CartInteractor: PresenterToInteractorCartProtocol {
    var cartPresenter: InteractorToPresenterCartProtocol?
    
    var foodTemp: [SepetYemek]?
    var kullaniciAdi = Auth.auth().currentUser!.email
    func getCartFoods() {
        let params: Parameters = ["kullanici_adi": kullaniciAdi!]
        AF.request("http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php", method: .post, parameters: params).response { [weak self] response in
            guard let self = self else { return }
            if let data = response.data {
                do {
                    let response = try JSONDecoder().decode(CartFoods.self, from: data)
                    print(data)
                    if let list = response.sepet_yemekler {
                        DispatchQueue.main.async {
                            self.cartPresenter?.didDataFecth(with: list)
                        }
                    }
            } catch {
                print(error.localizedDescription)
                self.cartPresenter?.didDataFecth(with: [])
                }
            }
        }
    }
    func deleteSelectedFood(with sepet_yemek_id: Int) {
        let params: Parameters = ["sepet_yemek_id": sepet_yemek_id, "kullanici_adi": kullaniciAdi!]
        AF.request("http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php", method: .post, parameters: params).response { [weak self] response in
            guard let self = self else { return }
            if let data = response.data {
                do {
                    let response = try JSONSerialization.jsonObject(with: data)
                    print(response)
                    self.getCartFoods()
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}
