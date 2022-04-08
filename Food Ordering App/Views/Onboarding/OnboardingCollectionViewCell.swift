//
//  OnboardingCollectionViewCell.swift
//  Food Ordering App
//
//  Created by Anisha Lamichhane on 4/5/22.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var slideTitle: UILabel!
    @IBOutlet weak var slideDescription: UILabel!
    
    func setUp(_ slide: OnboardingSlides){
        slideImageView.image = slide.image
        slideTitle.text = slide.title
        slideDescription.text = slide.description
    }
}
