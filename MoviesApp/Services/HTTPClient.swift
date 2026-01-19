//
//  HTTPClient.swift
//  MoviesApp
//
//  Created by Ronald Brown on 1/18/26.
//  Copyright © 2026 Mohammad Azam. All rights reserved.
//
import Foundation

enum NetworkError: Error {
    case badURL
    case noData
    case decodingError
}

class HTTPClient {
    
    func getMoviesBy(search: String, completion: @escaping (Result<[Movie]?, NetworkError>) -> Void) {
        // make sure we have a good url
        guard let url = URL(string: "https://www.omdbapi.com/?s=\(search)&apikey=\(Constants.API_KEY)") else {
            return completion(.failure(.badURL))
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            // make sure we have data
            guard let data, error == nil else {
                return completion(.failure(.noData))
            }
            // make sure we can decode that data
            guard let movieResponse = try? JSONDecoder().decode(MovieResponse.self, from: data) else {
                return completion(.failure(.decodingError))
            }
            
            completion(.success(movieResponse.movies))

        }.resume()
    }
}
