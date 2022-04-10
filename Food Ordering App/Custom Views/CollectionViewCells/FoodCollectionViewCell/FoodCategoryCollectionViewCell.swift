//
//  FoodCategoryCollectionViewCell.swift
//  Food Ordering App
//
//  Created by Anisha Lamichhane on 4/9/22.
//

import UIKit
import Kingfisher

class FoodCategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setUp(category: DishCategory){
        categoryImageView.kf.setImage(with: category.categoryImage.asURL)
        categoryLabel.text = category.categoryLabel
    }

}
