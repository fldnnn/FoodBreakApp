//
//  DetailFoodViewController.swift
//  FoodBreak
//
//  Created by Fulden Onan on 24.10.2022.
//

import UIKit
import Kingfisher
import FirebaseAuth

class DetailFoodViewController: UIViewController {

    @IBOutlet private weak var detailImageView: UIImageView!
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var stepper: UIStepper!
    @IBOutlet private weak var stepperValueLabel: UILabel!
    @IBOutlet weak var addToCartOutlet: UIButton!
    
    var food: Food?
    var detailPresenterObject: ViewToPresenterDetailProtocol?
    var kullaniciAdi = Auth.auth().currentUser!.email
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DetailFoodRouter.createModule(ref: self)
        setupDetailUI()
        detailImageView.addShadow()
        addToCartOutlet.cornerButton()
        
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
    
    private func setupDetailUI() {
        addToCartOutlet.backgroundColor = .black
        navigationController?.navigationBar.tintColor = UIColor.black
        //navigationItem.backButtonTitle = " "
    }

    @IBAction private func stepperButton(_ sender: UIStepper) {
        let stepperValue = stepper.value
        stepperValueLabel.text = "\(Int(stepperValue))"
        
        priceLabel.text = "₺\(Int(stepperValue) * Int((food?.yemek_fiyat)!)!)"
    }

    @IBAction private func addToCart(_ sender: Any) {
        if let food = food {
            detailPresenterObject?.addFood(food: food, count: Int(stepper.value), username: kullaniciAdi!)
        }
    }
}
