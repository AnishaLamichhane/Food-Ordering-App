//
//  Route.swift
//  Food Ordering App
//
//  Created by Anisha Lamichhane on 4/17/22.
//

import Foundation

enum Route{
    static let baseUrl = "https://yummie.glitch.me/"
    
    case fetchAllCategories
    case  placeOrder(String)
    
    var description: String{
        switch self{
            
        case .fetchAllCategories:
            return "/dish-categories"
            
        case .placeOrder(let dishId):
            return "/orders/\(dishId)"
        }
    }
}
