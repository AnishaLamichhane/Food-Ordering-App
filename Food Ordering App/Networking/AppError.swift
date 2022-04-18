//
//  AppError.swift
//  Food Ordering App
//
//  Created by Anisha Lamichhane on 4/18/22.
//

import Foundation

enum AppError: LocalizedError{
    case errorDecoding
    case unknownError
    case invalidUrl
    case serverError(String)
    
    var errorDescription: String?{
        switch self {
        case .errorDecoding:
            return "Response couldnot be decoded."
        case .unknownError:
            return "It's an unknown error dude."
        case .invalidUrl:
            return "It is an invalid URL!!"
        case .serverError(let string):
            return string
        }
    }
}
