//
//  Network.swift
//  CountiesApp
//
//  Created by Ihor Malovanyi on 10.03.2022.
//

import Foundation

enum NetworkError: Error {
    
    case notAnURL
    
}

//'All in' service because the request is simple. Creating a general engine to make get/post/put/etc requests with different params and settings is good. But the case is small to such a vast implementation.
final class NetworkService {
    
    enum Result<T: Decodable> {
        
        case error
        case result(T)
        
    }
    
    func dataTask<T: Decodable>(for urlString: String, completion: @escaping (Result<T>) -> ()) throws -> URLSessionDataTask {
        
        guard let url = URL(string: urlString) else {
            throw NetworkError.notAnURL
        }
        
        return URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data,
               let decoded = try? JSONDecoder().decode(T.self, from: data) {
                completion(.result(decoded))
            } else {
                completion(.error)
            }
        }
    }
    
}
