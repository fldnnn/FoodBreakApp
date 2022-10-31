//
//  SignInContract.swift
//  FoodBreak
//
//  Created by Fulden Onan on 29.10.2022.
//  
//

import Foundation

protocol ViewToPresenterSignInProtocol {
    var signInInteractor: PresenterToInteractorSignInProtocol? { get set }
    var signInView: PresenterToViewSignInProtocol? { get set }
    
    func onSignInButtonPressed(email: String, password: String)
}

protocol PresenterToInteractorSignInProtocol {
    var signInPresenter: InteractorToPresenterSignInProtocol? { get set }
    
    func signIn(email: String, password: String)
}

protocol InteractorToPresenterSignInProtocol {
    func showErr(with error: String)
}

protocol PresenterToViewSignInProtocol {
    func updateView(with error: String)
}

protocol PresenterToRouterSignInProtocol {
    static func  createModuler(ref: SignInViewController)
}
