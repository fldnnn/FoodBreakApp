//
//  HomeRouter.swift
//  FoodBreak
//
//  Created by Fulden Onan on 24.10.2022.
//

import Foundation

class HomeRouter: PresenterToRouterHomeProtocol {
    static func createModule(ref: HomeViewController) {
        let presenter = HomePresenter()
        
        ref.homePresenterObject = presenter
        
        ref.homePresenterObject?.homeInteractor = HomeInteractor()
        ref.homePresenterObject?.homeView = ref
        
        ref.homePresenterObject?.homeInteractor?.homePresenter = presenter
    }
}
