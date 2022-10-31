//
//  SignInRouter.swift
//  FoodBreak
//
//  Created by Fulden Onan on 29.10.2022.
//  
//

import UIKit

class SignInRouter: PresenterToRouterSignInProtocol {
    static func createModuler(ref: SignInViewController) {
        let presenter = SignInPresenter()
        ref.signInPresenter = presenter
        
        ref.signInPresenter?.signInView = ref
        ref.signInPresenter?.signInInteractor = SignInInteractor()
        
        ref.signInPresenter?.signInInteractor?.signInPresenter = presenter
    }
}
