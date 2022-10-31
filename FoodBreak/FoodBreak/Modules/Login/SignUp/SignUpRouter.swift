//
//  SignUpRouter.swift
//  FoodBreak
//
//  Created by Fulden Onan on 29.10.2022.
//  
//

import UIKit

class SignUpRouter: PresenterToRouterSignUpProtocol {
    static func createModule(ref: SignUpViewController) {
        ref.signUpPresenter = SignUpPresenter()
        ref.signUpPresenter?.interactor = SignUpInteractor()
    }
}
