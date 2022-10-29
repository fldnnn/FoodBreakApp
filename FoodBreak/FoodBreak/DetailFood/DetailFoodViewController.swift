//
//  DetailFoodViewController.swift
//  FoodBreak
//
//  Created by Fulden Onan on 24.10.2022.
//

import UIKit
import Kingfisher

class DetailFoodViewController: UIViewController {

    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var stepperValueLabel: UILabel!
    
    var hasFood: [String: Any] = [:]
    //var count = 0
    var food: Food?
    var tempFood: [Food]?
    var detailPresenterObject: ViewToPresenterDetailProtocol?
    var kullaniciAdi = "sjhdt"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DetailFoodRouter.createModule(ref: self)
        
        if let f = food {
            priceLabel.text = "₺\(f.yemek_fiyat!)"
            nameLabel.text = f.yemek_adi
        }
        
        if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(food!.yemek_resim_adi!)") {
            DispatchQueue.main.async {
                self.detailImageView.kf.setImage(with: url)
            }
        }
    }
    @IBAction func stepperButton(_ sender: UIStepper) {
        let stepperValue = stepper.value
        stepperValueLabel.text = "\(Int(stepperValue))"
        
        priceLabel.text = "₺\(Int(stepperValue) * Int((food?.yemek_fiyat)!)!)"
    }
    @IBAction func addToCart(_ sender: Any) {
        if let food = food {
            detailPresenterObject?.addFood(food: food, count: Int(stepper.value), username: kullaniciAdi)
        }
    }
}
