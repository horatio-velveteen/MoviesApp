//
//  Movie.swift
//  MoviesApp
//
//  Created by Ronald Brown on 1/18/26.
//  Copyright © 2026 Mohammad Azam. All rights reserved.
//
import Foundation

struct MovieResponse: Codable {
    let movies: [Movie]
    enum CodingKeyes : String, CodingKey {
        case movies = "Search"
    }
}

struct Movie: Codable {
    let title: String
    let year: String
    let imdbId: String
    let poster: String
    
    private enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbId = "imdbID"
        case poster = "Poster"
    }
}
  
