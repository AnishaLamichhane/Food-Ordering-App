//
//  DishListTableViewCell.swift
//  Food Ordering App
//
//  Created by Anisha Lamichhane on 4/13/22.
//

import UIKit
import Kingfisher

class DishListTableViewCell: UITableViewCell {
   static let identifier = String(describing: DishListTableViewCell.self)
    
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
   func setUp(dish: Dish)  {
        dishImageView.kf.setImage(with: dish.image?.asURL)
        titleLbl.text = dish.name
        descriptionLbl.text = dish.description
    }
}


