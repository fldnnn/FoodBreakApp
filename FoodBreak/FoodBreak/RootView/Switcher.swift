//
//  Switcher.swift
//  FoodBreak
//
//  Created by Fulden Onan on 30.10.2022.
//

import Foundation
import UIKit

class Switcher {
    static func updateRootVC(){

        let status = UserDefaults.standard.bool(forKey: "status")

        print(status)
        if let sceneDeleagate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate,
                let window = sceneDeleagate.window {
            if status == true {
                let rootVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeVC") as! UITabBarController
                window.rootViewController = rootVC
            } else {
                let rootVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginVC")
                window.rootViewController = rootVC
            }
            
        }
    }
}

