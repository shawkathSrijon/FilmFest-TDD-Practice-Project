//
//  MovieManagerTests.swift
//  FilmFestTests
//
//  Created by Simec Sys Ltd. on 25/1/21.
//

import XCTest
@testable import FilmFest

class MovieManagerTests: XCTestCase {
    var sut: MovieManager!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = MovieManager()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    //MARK:- Initial Values
    func testInit_MoviesToSeeCount_ReturnsZero() {
        XCTAssertEqual(sut.moviesToSeeCount, 0)
    }
    
    func testInit_MoviesSeenCount_ReturnsZero() {
        XCTAssertEqual(sut.moviesSeenCount, 0)
    }
    
    //MARK:- Add and Query
    func testAdd_MoviesToSee_ReturnsOne() {
        let testMovie = Movie(title: "Sci-Fi")
        sut.addMovie(movie: testMovie)
        
        XCTAssertEqual(sut.moviesToSeeCount, 1)
    }
    
    func testQuery_ReturnMovieAtIndex() {
        let testMovie = Movie(title: "Arthouse Drama")
        sut.addMovie(movie: testMovie)
        
        let movieQueried = sut.movieAtIndex(index: 0)
        XCTAssertEqual(testMovie.title, movieQueried.title)
    }
    
    //MARK:- Checking Off
    func testCheckOffMovie_updatesMovieManagerCounts() {
        sut.addMovie(movie: Movie(title: "Action/Adventure"))
        
    }
}
