//
//  AllDishes.swift
//  Food Ordering App
//
//  Created by Anisha Lamichhane on 4/21/22.
//

import Foundation

struct AllDishes: Codable {
    let categories: [DishCategory]?
    let populars: [Dish]?
    let specials: [Dish]?
}
