//
//  APIManager.swift
//  TestApp
//
//  Created by Елизавета Ефросинина on 17/08/2023.
//

import Foundation

class APIManager {
    //MARK: -- Properties
    private static let basedUrl = "https://rickandmortyapi.com/api/character"
    
    //MARK: -- Methods
    static func getCharacters(completion: @escaping (Result<[Character], Error>) -> ()) {
        let stringUrl = basedUrl
        
        guard let url = URL(string: stringUrl) else { return }
        let session = URLSession.shared.dataTask(with: url) { data, _, error in
            handleResponse(data: data,
                           error: error,
                           completion: completion)
        }
        session.resume()
    }
    
    static func getImageData(url: String, completion: @escaping (Result<Data, Error>) -> ()) {
        guard let url = URL(string: url) else { return }
        
        let session = URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data {
                completion(.success(data))
            }
            
            if let error = error {
                completion(.failure(error))
            }
        }
        session.resume()
    }
    
    //MARK: -- Private Methods
    private static func handleResponse(data: Data?,
                                       error: Error?,
                                       completion: @escaping (Result<[Character], Error>) -> ()) {
        if let error = error {
            completion(.failure(NetworkingError.networkingError(error)))
        } else if let data = data {
            do {
                let model = try JSONDecoder().decode(ResultsResponseObject.self,
                                                     from: data)
                completion(.success(model.results))
            } catch let decodeError {
                completion(.failure(decodeError))
            }
        } else {
            completion(.failure(NetworkingError.unknown))
        }
    }
}
