//
//  CartViewController.swift
//  FoodBreak
//
//  Created by Fulden Onan on 25.10.2022.
//

import UIKit
import SwiftUI

class CartViewController: UIViewController {

    @IBOutlet weak var cartTableView: UITableView!
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    var cartFoodList = [SepetYemek]()
    
    var cartPresenterObject: ViewToPresenterCartProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CartRouter.createModule(ref: self)
        
        cartTableView.delegate = self
        cartTableView.dataSource = self
    
    }
    override func viewWillAppear(_ animated: Bool) {
        cartPresenterObject?.viewDidLoad()
    }
}

extension CartViewController: PresenterToViewCartProtocol {
    func updateView(with cartFoodList: [SepetYemek]) {
        self.cartFoodList = cartFoodList
        self.cartTableView.reloadData()
    }
}

extension CartViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cartFoodList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let foods = cartFoodList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cartTableViewCell", for: indexPath) as! CartTableViewCell
        cell.cartNameLabel.text = foods.yemek_adi
        cell.cartPriceLabel.text = foods.yemek_fiyat
        cell.cartCountLabel.text = foods.yemek_siparis_adet
        if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(foods.yemek_resim_adi!)") {
            DispatchQueue.main.async {
                cell.cartImageView.kf.setImage(with: url)
            }
        }
        return cell
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Sil"){(ca, v, b) in
            let foods = self.cartFoodList[indexPath.row]
            
            let alert = UIAlertController(title: "Silme İşlemi", message: "\(foods.yemek_resim_adi!) silinsin mi?", preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: "İptal", style: .cancel)
            alert.addAction(cancelAction)
            
            let yesAction = UIAlertAction(title: "Evet", style: .destructive) {action in
                self.cartPresenterObject?.deleteFood(with: Int(foods.sepet_yemek_id!)!)
            }
            alert.addAction(yesAction)
            
            self.present(alert, animated: true)
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}