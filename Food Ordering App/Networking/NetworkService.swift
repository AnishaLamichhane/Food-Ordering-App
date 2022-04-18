//
//  NetworkService.swift
//  Food Ordering App
//
//  Created by Anisha Lamichhane on 4/17/22.
//

import Foundation

struct NetworkService {
     func createRequest(route: Route, method: Method, parameters: [String: Any]? = nil) -> URLRequest? {
        let urlString = Route.baseUrl + route.description
        guard let url = urlString.asURL else {
            print("this is not a valid url")
            return nil
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = method.rawValue
        
        if let params = parameters  {
            switch method {
                
                
            case .get:
                var urlComponent = URLComponents(string: urlString)
                urlComponent?.queryItems = params.map {
                    URLQueryItem(name: $0, value: "\($1)")
                }
                
                urlRequest.url = urlComponent?.url
                
                
            case .post, .delete, .patch:
                let bodyData = try? JSONSerialization.data(withJSONObject: params, options: [])
                urlRequest.httpBody = bodyData
            }
        }
        
        return urlRequest
    }
}
