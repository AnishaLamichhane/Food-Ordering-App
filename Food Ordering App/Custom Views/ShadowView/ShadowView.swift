//
//  ShadowView.swift
//  Food Ordering App
//
//  Created by Anisha Lamichhane on 4/10/22.
//

import Foundation
import UIKit

class ShadowView: UIView{
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetUp()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialSetUp()
    }
    
    private func initialSetUp(){
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .zero
        layer.cornerRadius = 10
        layer.shadowOpacity = 0.1
        
    }
    
    
}
