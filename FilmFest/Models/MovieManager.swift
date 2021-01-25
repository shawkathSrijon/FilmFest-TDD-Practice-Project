//
//  MovieManager.swift
//  FilmFest
//
//  Created by Simec Sys Ltd. on 25/1/21.
//

import Foundation

class MovieManager {
    var moviesToSeeCount = 0
    let moviesSeenCount = 0
    
    private var moviesToSeeArray = [Movie]()
    
    func addMovie(movie: Movie) {
        moviesToSeeCount += 1
        moviesToSeeArray.append(movie)
    }
    func movieAtIndex(index: Int) -> Movie {
        return moviesToSeeArray[index]
    }
}
