//
//  FoodCategoryCollectionViewCell.swift
//  Food Ordering App
//
//  Created by Anisha Lamichhane on 4/9/22.
//

import UIKit
import Kingfisher

class CategoryCollectionViewCell: UICollectionViewCell {
    
   static let identifier = "CategoryCollectionViewCell"

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var title: UILabel!
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setUp(category: DishCategory){
        image.kf.setImage(with: category.image?.asURL)
        title.text = category.title
    }

}
