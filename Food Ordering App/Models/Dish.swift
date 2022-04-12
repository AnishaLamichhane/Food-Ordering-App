//
//  Dish.swift
//  Food Ordering App
//
//  Created by Anisha Lamichhane on 4/10/22.
//

import Foundation
 
struct Dish{
    let id , name , description, image : String?
    let calories: Double?
    
    var formattedCalories: String{
        return String(format: "%.2f calories ", calories ?? 0)
    }
}
