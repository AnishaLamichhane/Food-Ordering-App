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
    @IBOutlet weak var chefSpecialCollectionView: UICollectionView!
    
    var categories:[DishCategory] = [
        .init(id: "id1", categoryImage: "https://picsum.photos/100/200", categoryLabel: "Flower Image"),
        .init(id: "id2", categoryImage: "https://picsum.photos/100/200", categoryLabel: "some Image"),
        .init(id: "id3", categoryImage: "https://picsum.photos/100/200", categoryLabel: "leaves Image"),
        .init(id: "id4", categoryImage: "https://picsum.photos/100/200", categoryLabel: "thorn Image"),
        .init(id: "id5", categoryImage: "https://picsum.photos/100/200", categoryLabel: "nice Image")
        
    ]
    
    var popularDishes:[Dish] = [
        .init(id: "id1", name: "Garri", description: "This is the best I have.", image: "https://picsum.photos/100/200", calories: 34.2822),
        .init(id: "id1", name: "Harri", description: "This is the best I have.", image: "https://picsum.photos/100/200", calories: 34.2822),
        .init(id: "id1", name: "Sarri", description: "This is the best I have.", image: "https://picsum.photos/100/200", calories: 34.2822),
        .init(id: "id1", name: "Garri", description: "This is the best I have.", image: "https://picsum.photos/100/200", calories: 34.2822),
    ]
    
    var chefSpecial: [Dish] = [
        .init(id: "id1", name: "Plantian", description: "This is my special dish.his is my special dish.his is my special dish.his is my special dish.his is my special dish.his is my special dish.his is my special dish.his is my special dish.his is my special dish.his is my special dish.his is my special dish.his is my special dish.his is my special dish.", image: "https://picsum.photos/100/100", calories: 34.2822),
        .init(id: "id1", name: "Nope", description: "This is tmy special dish.", image: "https://picsum.photos/100/200", calories: 34.2822),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        popularCollectionView.register(UINib(nibName: PopularCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: PopularCollectionViewCell.identifier)
        chefSpecialCollectionView.register(UINib(nibName: ChefSpecialCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: ChefSpecialCollectionViewCell.identifier)
        
    }
}


extension HomeViewController: UICollectionViewDelegate,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView{
        case categoryCollectionView:
            return categories.count
            
        case popularCollectionView:
            return popularDishes.count
            
        case chefSpecialCollectionView:
            return chefSpecial.count
            
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
        case chefSpecialCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChefSpecialCollectionViewCell.identifier, for: indexPath) as! ChefSpecialCollectionViewCell
            cell.setUp(dish: popularDishes[indexPath.row])
            return cell
            
        default: return UICollectionViewCell()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == categoryCollectionView  {
            let controller = ListDishesViewController.instantiate()
            controller.category = categories[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        }else {
            let controller = DishDetailViewController.instantiate()
            controller.dish = collectionView  == popularCollectionView ? popularDishes[indexPath.row] : chefSpecial[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)

        }
    }
    
    
}
