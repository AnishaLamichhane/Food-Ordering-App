//
//  UIViewExtension.swift
//  Food Ordering App
//
//  Created by Anisha Lamichhane on 4/5/22.
//

import Foundation
import UIKit

extension UIButton{
    
    @IBInspectable var cornerRadius: CGFloat{
        get { return self.cornerRadius }
        set {
            self.layer.cornerRadius = newValue
        }
    }
    
}
