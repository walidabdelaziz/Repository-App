//
//  NetworkManager.swift
//  Repository-App
//
//  Created by Walid Ahmed on 13/06/2023.
//

import Foundation
import UIKit

enum Result<T> {
    case success(T)
    case failure(Error)
}

class NetworkManager {

    static let shared = NetworkManager()
    private init() {}
    
    func request<T: Decodable>(from urlString: String, completionHandler: @escaping (Result<T>) -> Void) {
        guard let url = URL(string: urlString) else { return }
        let urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        let request = URLRequest(url: urlComponents.url!)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completionHandler(Result.failure(error))
            }
            if let data = data {
                do {
                    let decodedObject = try JSONDecoder().decode(T.self, from: data)
                    completionHandler(Result.success(decodedObject))
                } catch {
                    completionHandler(Result.failure(error))
                }
            }
        }.resume()
    }

}
