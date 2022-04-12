//
//  HomeViewController.swift
//  Food Ordering App
//
//  Created by Anisha Lamichhane on 4/9/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var popularCollectionView: UICollectionView!
    
    var categories:[DishCategory] = [
        .init(id: "id1", categoryImage: "https://picsum.photos/100/200", categoryLabel: "Flower Image"),
        .init(id: "id2", categoryImage: "https://picsum.photos/100/200", categoryLabel: "some Image"),
        .init(id: "id3", categoryImage: "https://picsum.photos/100/200", categoryLabel: "leaves Image"),
        .init(id: "id4", categoryImage: "https://picsum.photos/100/200", categoryLabel: "thorn Image"),
        .init(id: "id5", categoryImage: "https://picsum.photos/100/200", categoryLabel: "nice Image")
    
    ]
    
    var popularDishes:[Dish] = [
        .init(id: "id1", name: "Garri", description: "This is the best I have.", image: "https://picsum.photos/100/200", calories: 34.2822),
        .init(id: "id1", name: "Garri", description: "This is the best I have.", image: "https://picsum.photos/100/200", calories: 34.2822),
        .init(id: "id1", name: "Garri", description: "This is the best I have.", image: "https://picsum.photos/100/200", calories: 34.2822),
        .init(id: "id1", name: "Garri", description: "This is the best I have.", image: "https://picsum.photos/100/200", calories: 34.2822)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        popularCollectionView.register(UINib(nibName: PopularCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: PopularCollectionViewCell.identifier)
    }
}


extension HomeViewController: UICollectionViewDelegate,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView{
        case categoryCollectionView:
            return categories.count
            
        case popularCollectionView:
            return popularDishes.count
            
        default: return 0
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView{
        case categoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
            cell.setUp(category: categories[indexPath.row])
            return cell
            
        case popularCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularCollectionViewCell.identifier, for: indexPath) as! PopularCollectionViewCell
            cell.setUp(dish: popularDishes[indexPath.row])
            return cell
            
        default: return UICollectionViewCell()
        }
       
    }
    
    
}
