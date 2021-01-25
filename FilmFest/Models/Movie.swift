//
//  Movie.swift
//  FilmFest
//
//  Created by Simec Sys Ltd. on 25/1/21.
//

import Foundation

struct Movie {
    let title: String
    let releaseDate: String?
    
    init(title: String, releaseDate: String? = nil) {
        self.title = title
        self.releaseDate = releaseDate
    }
}
