//
//  SignInPresenter.swift
//  FoodBreak
//
//  Created by Fulden Onan on 29.10.2022.
//  
//

import Foundation

class SignInPresenter: ViewToPresenterSignInProtocol {
    var signInView: PresenterToViewSignInProtocol?
    var signInInteractor: PresenterToInteractorSignInProtocol?
    
    func onSignInButtonPressed(email: String, password: String) {
        signInInteractor?.signIn(email: email, password: password)
    }
}

extension SignInPresenter: InteractorToPresenterSignInProtocol {
    func showErr(with error: String) {
        signInView?.updateView(with: error)
    }
}
