//
//  CartInteractor.swift
//  FoodBreak
//
//  Created by Fulden Onan on 25.10.2022.
//

import Foundation
import Alamofire

class CartInteractor: PresenterToInteractorCartProtocol {
    var cartPresenter: InteractorToPresenterCartProtocol?
    
    var foodTemp: [SepetYemek]?
    var kullaniciAdi = "Fulden"
    func getCartFoods() {
        let params: Parameters = ["kullanici_adi": kullaniciAdi]
        AF.request("http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php", method: .post, parameters: params).response { response in
            if let data = response.data {
                do {
                    let response = try JSONDecoder().decode(CartFoods.self, from: data)
                    print(data)
                    if let list = response.sepet_yemekler {
                        DispatchQueue.main.async {
                            self.cartPresenter?.didDataFecth(with: list)
//                            for i in list {
//                                if list.contains(where: {
//                                    $0.yemek_adi == i.yemek_adi }) {
//                                    let adet = Int(i.yemek_siparis_adet!)
//                                }
//
//                            }
                            //presenter a tası
                            let dict = Dictionary(grouping: list, by: {$0.yemek_adi}).mapValues { $0.reduce(0, { Int("\($0)")! + Int("\($1.yemek_siparis_adet ?? "0")")! })}
                            
                            //let dict2 = Dictionary(grouping: list, by: {$0.yemek_adi}).mapValues { $0.map({$0.sepet_yemek_id})}
                            print(dict)
                            //print(dict2)
                        }
                    }
            }catch{
                print(error.localizedDescription)
                }
            }
        }
    }
    func deleteSelectedFood(with sepet_yemek_id: Int) {
        let params: Parameters = ["sepet_yemek_id": sepet_yemek_id, "kullanici_adi": kullaniciAdi]
        AF.request("http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php", method: .post, parameters: params).response { response in
            if let data = response.data {
                do{
                    let response = try JSONSerialization.jsonObject(with: data)
                    print(response)
                    self.getCartFoods()
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
}
