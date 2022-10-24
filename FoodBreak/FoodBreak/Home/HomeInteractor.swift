//
//  HomeInteractor.swift
//  FoodBreak
//
//  Created by Fulden Onan on 24.10.2022.
//

import Foundation
import Alamofire

class HomeInteractor: PresenterToInteractorHomeProtocol {
    var homePresenter: InteractorToPresenterHomeProtocol?
    
    func getFoods() {
        AF.request("http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php", method: .get).response { response in
            if let data = response.data {
                do {
                    let response = try JSONDecoder().decode(Foods.self, from: data)
                    print(data)
                    if let list = response.yemekler {
                        DispatchQueue.main.async {
                            self.homePresenter?.didDataFecth(with: list)
                        }
                    }
                }catch{
                    print(error.localizedDescription)
                }
            }
            
        }
    }   
}
