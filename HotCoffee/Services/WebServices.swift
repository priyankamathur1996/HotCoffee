//
//  WebServices.swift
//  HotCoffee
//
//  Created by call soft on 14/10/2019.
//  Copyright © 2019 call soft. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case decodingError
    case domainError
    case urlError
}

struct Resource<T: Codable> {
    let url: URL
}

class WebServices {
    
    func Load<T>(resource: Resource<T>, completion: @escaping (Result<T,NetworkError>) -> Void){
        
        URLSession.shared.dataTask(with: resource.url) { (data, response, error) in
            
            guard let data = data , error == nil else{
                completion(.failure(.domainError))
             return
            }
            
              //let jsonDecoder = JSONDecoder()
                let result = try? JSONDecoder().decode(T.self, from: data)
                if let result = result {
                    DispatchQueue.main.async {
                        completion(.success(result))
                    }
                }else{
                    completion(.failure(.decodingError))
                }
        }.resume()
        
    }
}

