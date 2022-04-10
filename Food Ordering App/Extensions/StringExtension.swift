//
//  StringExtension.swift
//  Food Ordering App
//
//  Created by Anisha Lamichhane on 4/9/22.
//

import Foundation
import UIKit

extension String{
    var asURL: URL? {
        return URL(string: self)
    }
}
