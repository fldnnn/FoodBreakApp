//
//  SignUpInteractor.swift
//  FoodBreak
//
//  Created by Fulden Onan on 29.10.2022.
//  
//

import Foundation
import FirebaseAuth
import Firebase

class SignUpInteractor: PresenterToInteractorSignUpProtocol {
    func signUp(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if error != nil {
                print(error!.localizedDescription)
            } else {
                print(result!)
                //let db = Firestore.firestore()
                
            }
        }
    }
}

