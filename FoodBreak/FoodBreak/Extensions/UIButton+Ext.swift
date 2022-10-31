//
//  UIButton+Ext.swift
//  FoodBreak
//
//  Created by Fulden Onan on 1.11.2022.
//

import Foundation
import UIKit

extension UIButton {
    func cornerButton() {
        layer.cornerRadius = 5
        clipsToBounds = true
    }
}
