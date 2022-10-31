//
//  FoodsCollectionViewCell.swift
//  FoodBreak
//
//  Created by Fulden Onan on 24.10.2022.
//

import UIKit

class FoodsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var foodNameLabel: UILabel!
    
    override func prepareForReuse() {
        addCornerCell()
    }
}
