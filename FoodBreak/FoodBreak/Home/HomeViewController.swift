//
//  ViewController.swift
//  FoodBreak
//
//  Created by Fulden Onan on 23.10.2022.
//

import UIKit
import Kingfisher

class HomeViewController: UIViewController {

    @IBOutlet weak var foodsCollectionView: UICollectionView!
    
    var foodList = [Food]()
    
    var homePresenterObject: ViewToPresenterHomeProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        foodsCollectionView.delegate = self
        foodsCollectionView.dataSource = self
        
        HomeRouter.createModule(ref: self)
        setupUI()
        
        homePresenterObject?.viewDidLoad()
    }
    
    private func setupUI() {
        let design = UICollectionViewFlowLayout()
        design.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        design.minimumInteritemSpacing = 10
        design.minimumLineSpacing = 10
        
        let screenWidth = UIScreen.main.bounds.width
        let cellWidth = (screenWidth - 30) / 2
        design.itemSize = CGSize(width: cellWidth, height: cellWidth*1.7)
        
        foodsCollectionView.collectionViewLayout = design
    }
}

extension HomeViewController: PresenterToViewHomeProtocol {
    func updateView(with foodList: [Food]) {
        self.foodList = foodList
        self.foodsCollectionView.reloadData()
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        foodList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let food = foodList[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "foodCell", for: indexPath) as! FoodsCollectionViewCell
        cell.foodNameLabel.text = "\(food.yemek_adi!)"
        
        if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(food.yemek_resim_adi!)") {
            DispatchQueue.main.async {
                cell.foodİmageView.kf.setImage(with: url)
            }
        }
        return cell
    }
}
