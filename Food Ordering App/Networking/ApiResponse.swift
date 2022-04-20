//
//  ApiResponse.swift
//  Food Ordering App
//
//  Created by Anisha Lamichhane on 4/20/22.
//

import Foundation

struct ApiResponse<T: Codable> : Codable {
    let status: Int
    let message: String?
    let data: T?
    let error: String?
}
