//
//  ViewController.swift
//  FoodBreak
//
//  Created by Fulden Onan on 23.10.2022.
//

import UIKit
import Kingfisher

class HomeViewController: UIViewController {

    @IBOutlet private weak var foodsCollectionView: UICollectionView!
    @IBOutlet private weak var usernameLabel: UILabel!
    @IBOutlet weak var foodSearchBar: UISearchBar!
    
    var foodList = [Food]()
    
    var homePresenterObject: ViewToPresenterHomeProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        foodsCollectionView.delegate = self
        foodsCollectionView.dataSource = self
        
        HomeRouter.createModule(ref: self)
        setupUI()

        homePresenterObject?.viewDidLoad()
        
        foodSearchBar.delegate = self
    }
    
    private func setupUI() {
        //CollectionView
        let design = UICollectionViewFlowLayout()
        design.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        design.minimumInteritemSpacing = 10
        design.minimumLineSpacing = 10
        
        let screenWidth = UIScreen.main.bounds.width
        let cellWidth = (screenWidth - 30) / 2
        design.itemSize = CGSize(width: cellWidth, height: cellWidth*1.5)
        
        foodsCollectionView.collectionViewLayout = design
        
        //TabBar
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = .white
        tabBarController?.tabBar.frame.size.height = 50
        
        changeColor(itemAppearance: appearance.stackedLayoutAppearance)
        changeColor(itemAppearance: appearance.inlineLayoutAppearance)
        changeColor(itemAppearance: appearance.compactInlineLayoutAppearance)
        
        tabBarController?.tabBar.standardAppearance = appearance
        tabBarController?.tabBar.scrollEdgeAppearance = appearance
        
        let username = UserDefaults.standard.value(forKey: "username")
        usernameLabel.text = "Merhaba \(username ?? "")!"
    }
    
    private func changeColor(itemAppearance: UITabBarItemAppearance) {
        itemAppearance.selected.iconColor = .black
        itemAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.black]
        
        itemAppearance.normal.iconColor = .lightGray
        itemAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.lightGray]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            if let food = sender as? Food {
                let detailVC = segue.destination as! DetailFoodViewController
                detailVC.food = food
            }
        }
    }
}

extension HomeViewController: PresenterToViewHomeProtocol {
    func updateView(with foodList: [Food]) {
        self.foodList = foodList
        self.foodsCollectionView.reloadData()
    }
}

extension HomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            homePresenterObject?.viewDidLoad()
        } else {
            homePresenterObject?.onSearchButtonPressed(with: searchText)
        }
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
                cell.foodImageView.kf.setImage(with: url)
            }
        }
        cell.addCornerCell()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let food = foodList[indexPath.row]
        performSegue(withIdentifier: "toDetail", sender: food)
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}

