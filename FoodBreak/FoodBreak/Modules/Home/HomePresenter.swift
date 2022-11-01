//
//  HomePresenter.swift
//  FoodBreak
//
//  Created by Fulden Onan on 24.10.2022.
//

import Foundation

class HomePresenter: ViewToPresenterHomeProtocol {
    var homeInteractor: PresenterToInteractorHomeProtocol?
    var homeView: PresenterToViewHomeProtocol?
    
    func viewDidLoad() {
        homeInteractor?.getFoods()
    }
    
    func onSearchButtonPressed(with searchTerm: String) {
        homeInteractor?.searchFoods(with: searchTerm)
    }
}

extension HomePresenter: InteractorToPresenterHomeProtocol {
    func didDataFecth(with foodList: [Food] ) {
        homeView?.updateView(with: foodList )
    }
}
