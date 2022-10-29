//
//  HomeContract.swift
//  FoodBreak
//
//  Created by Fulden Onan on 24.10.2022.
//

import Foundation

protocol ViewToPresenterHomeProtocol {
    var homeInteractor: PresenterToInteractorHomeProtocol? {get set}
    var homeView: PresenterToViewHomeProtocol? {get set}
    
    func viewDidLoad()
}

protocol PresenterToInteractorHomeProtocol {
    var homePresenter: InteractorToPresenterHomeProtocol? {get set}
    
    func getFoods()
}

protocol InteractorToPresenterHomeProtocol {
    func didDataFecth(with foodList: [Food])
}

protocol PresenterToViewHomeProtocol {
    func updateView(with foodList: [Food])
}

protocol PresenterToRouterHomeProtocol {
    static func createModule(ref: HomeViewController)
}
