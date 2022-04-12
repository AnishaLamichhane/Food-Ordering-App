//
//  ChefSpecialCollectionViewCell.swift
//  Food Ordering App
//
//  Created by Anisha Lamichhane on 4/12/22.
//

import UIKit
import Kingfisher

class ChefSpecialCollectionViewCell: UICollectionViewCell {
    static let identifier = String(describing: ChefSpecialCollectionViewCell.self)
    
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var caloriesLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setUp(dish: Dish){
        dishImageView.kf.setImage(with: dish.image?.asURL) 
        titleLbl.text = dish.name
        descriptionLbl.text = dish.description
        caloriesLbl.text = dish.formattedCalories
    }

}
