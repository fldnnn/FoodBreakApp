//
//  CartTableViewCell.swift
//  FoodBreak
//
//  Created by Fulden Onan on 25.10.2022.
//

import UIKit

class CartTableViewCell: UITableViewCell {

    @IBOutlet weak var cartNameLabel: UILabel!
    @IBOutlet weak var cartPriceLabel: UILabel!
    @IBOutlet weak var cartImageView: UIImageView!
    @IBOutlet weak var cartCountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}
