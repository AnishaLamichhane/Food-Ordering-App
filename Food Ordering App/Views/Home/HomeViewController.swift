//
//  HomeViewController.swift
//  Food Ordering App
//
//  Created by Anisha Lamichhane on 4/9/22.
//

import UIKit
import ProgressHUD

class HomeViewController: UIViewController {
	static let controllerIdentifier = String(describing: HomeViewController.self)
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var popularCollectionView: UICollectionView!
    @IBOutlet weak var chefSpecialCollectionView: UICollectionView!
    
    var categories:[DishCategory] = []
    var popularDishes:[Dish] = []
    var chefSpecial: [Dish] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        popularCollectionView.register(UINib(nibName: PopularCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: PopularCollectionViewCell.identifier)
        chefSpecialCollectionView.register(UINib(nibName: ChefSpecialCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: ChefSpecialCollectionViewCell.identifier)
        
        ProgressHUD.show()
        
        NetworkService.shared.fetchAllCategories { [self] (result) in
            switch result {
                
            case .success(let allDishes):
                ProgressHUD.dismiss()
                categories = allDishes.categories ?? []
                popularDishes = allDishes.populars ?? []
                chefSpecial = allDishes.specials ?? []
                
                categoryCollectionView.reloadData()
                popularCollectionView.reloadData()
                chefSpecialCollectionView.reloadData()
                
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
        
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
