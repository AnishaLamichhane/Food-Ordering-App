//
//  HomeViewController.swift
//  Food Ordering App
//
//  Created by Anisha Lamichhane on 4/9/22.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    var categories:[DishCategory] = [
        .init(id: "id1", categoryImage: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.teahub.io%2Fviewwp%2FhJixhx_some-wallpapers-some-beautiful%2F&psig=AOvVaw32r1bYIQ5ZoAoh7D2TDc17&ust=1649608315523000&source=images&cd=vfe&ved=0CAoQjRxqFwoTCMDl0_-zh_cCFQAAAAAdAAAAABAD", categoryLabel: "Flower Image"),
        .init(id: "id2", categoryImage: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.teahub.io%2Fviewwp%2FhJixhx_some-wallpapers-some-beautiful%2F&psig=AOvVaw32r1bYIQ5ZoAoh7D2TDc17&ust=1649608315523000&source=images&cd=vfe&ved=0CAoQjRxqFwoTCMDl0_-zh_cCFQAAAAAdAAAAABAD", categoryLabel: "some Image"),
        .init(id: "id3", categoryImage: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.teahub.io%2Fviewwp%2FhJixhx_some-wallpapers-some-beautiful%2F&psig=AOvVaw32r1bYIQ5ZoAoh7D2TDc17&ust=1649608315523000&source=images&cd=vfe&ved=0CAoQjRxqFwoTCMDl0_-zh_cCFQAAAAAdAAAAABAD", categoryLabel: "leaves Image"),
        .init(id: "id4", categoryImage: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.teahub.io%2Fviewwp%2FhJixhx_some-wallpapers-some-beautiful%2F&psig=AOvVaw32r1bYIQ5ZoAoh7D2TDc17&ust=1649608315523000&source=images&cd=vfe&ved=0CAoQjRxqFwoTCMDl0_-zh_cCFQAAAAAdAAAAABAD", categoryLabel: "thorn Image"),
        .init(id: "id5", categoryImage: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.teahub.io%2Fviewwp%2FhJixhx_some-wallpapers-some-beautiful%2F&psig=AOvVaw32r1bYIQ5ZoAoh7D2TDc17&ust=1649608315523000&source=images&cd=vfe&ved=0CAoQjRxqFwoTCMDl0_-zh_cCFQAAAAAdAAAAABAD", categoryLabel: "nice Image")
    
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryCollectionView.register(UINib(nibName: "FoodCategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "FoodCategoryCollectionViewCell")
    }
}


extension HomeViewController: UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FoodCategoryCollectionViewCell", for: indexPath) as! FoodCategoryCollectionViewCell
        cell.setUp(category: categories[indexPath.row])
        return cell
    }
    
    
}
