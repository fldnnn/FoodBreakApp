//
//  ProfileViewController.swift
//  FoodBreak
//
//  Created by Fulden Onan on 30.10.2022.
//

import UIKit
import FirebaseAuth

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    

    @IBAction func logOutButton(_ sender: Any) {
        let firebaseAuth = Auth.auth()
        
        do {
            try firebaseAuth.signOut()
            UserDefaults.standard.set(false, forKey: "status")
            Switcher.updateRootVC()
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }
    }
}
