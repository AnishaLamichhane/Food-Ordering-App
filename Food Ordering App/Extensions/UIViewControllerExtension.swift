//
//  UIViewControllerExtension.swift
//  Food Ordering App
//
//  Created by Anisha Lamichhane on 4/13/22.
//

import Foundation
import UIKit

extension UIViewController{
    static var identifier: String {
        String(describing: self)
}

static func instantiate() -> Self {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
   return storyboard.instantiateViewController(withIdentifier: identifier) as! Self
}
    
}
