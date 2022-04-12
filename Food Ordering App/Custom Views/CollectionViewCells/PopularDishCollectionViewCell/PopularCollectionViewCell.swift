//
//  PopularCollectionViewCell.swift
//  Food Ordering App
//
//  Created by Anisha Lamichhane on 4/10/22.
//

import UIKit
import Kingfisher

class PopularCollectionViewCell: UICollectionViewCell {
    static let identifier = String(describing: PopularCollectionViewCell.self)
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var caloriesLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setUp(dish: Dish){
        titleLbl.text = dish.name
        dishImageView.kf.setImage(with: dish.image?.asURL)
        caloriesLbl.text = dish.formattedCalories
        descriptionLbl.text = dish.description
        
    }
}
