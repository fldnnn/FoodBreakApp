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
        AF.request("http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php", method: .get).response { [weak self] response in
            guard let self = self else { return }
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
    
    func searchFoods(with searchTerm: String) {
        AF.request("http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php", method: .get).response { [weak self] response in
            guard let self = self else { return }
            if let data = response.data {
                do {
                    let response = try JSONDecoder().decode(Foods.self, from: data)
                    print(data)
                    if let list = response.yemekler {
                        var searchedFoodList = [Food]()
                        for food in list {
                            if food.yemek_adi!.lowercased().contains(searchTerm.lowercased()) {
                                searchedFoodList.append(food)
                            }
                        }
                        DispatchQueue.main.async {
                            self.homePresenter?.didDataFecth(with: searchedFoodList)
                        }
                    }
                }catch{
                    print(error.localizedDescription)
                }
            }
            
        }
    }
}
