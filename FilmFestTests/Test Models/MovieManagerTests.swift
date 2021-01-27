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
    
    let scifiMovie = Movie(title: "Sci-Fi")
    let arthouseMovie = Movie(title: "Arthouse Drama")
    let adventureMovie = Movie(title: "Action/Adventure")
    
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
        sut.addMovie(movie: scifiMovie)
        XCTAssertEqual(sut.moviesToSeeCount, 1)
    }
    
    func testQuery_ReturnMovieAtIndex() {
        sut.addMovie(movie: arthouseMovie)
        
        let movieQueried = sut.movieAtIndex(index: 0)
        XCTAssertEqual(arthouseMovie.title, movieQueried.title)
    }
    
    //MARK:- Checking Off
    func testCheckOffMovie_UpdatesMovieManagerCounts() {
        sut.addMovie(movie: adventureMovie)
        sut.checkOffMovieAtIndex(index: 0)
        
        XCTAssertEqual(sut.moviesToSeeCount, 0)
        XCTAssertEqual(sut.moviesSeenCount, 1)
    }
    
    func testCheckOffMovie_RemoveMovieFromArray() {
        sut.addMovie(movie: scifiMovie)
        sut.addMovie(movie: adventureMovie)
        sut.checkOffMovieAtIndex(index: 0)
        
        XCTAssertEqual(sut.movieAtIndex(index: 0).title, adventureMovie.title)
    }
    
    func testCheckOffMovie_ReturnsMovieAtIndex() {
        sut.addMovie(movie: scifiMovie)
        sut.checkOffMovieAtIndex(index: 0)
        
        let checkedOffMovie = sut.checkedOffMovieAtIndex(index: 0)
        XCTAssertEqual(scifiMovie.title, checkedOffMovie.title)
    }
    
    //MARK:- Equitable
    func testEquitable_ReturnsTrue() {
        let actionMovie1 = Movie(title: "Action")
        let actionMovie2 = Movie(title: "Action")
        
        XCTAssertEqual(actionMovie1, actionMovie2)
    }
    
    func testEquitable_ReturnsNotEqualForDifferentTitles() {
        let actionMovie1 = Movie(title: "Action")
        let actionMovie2 = Movie(title: "Adventure")
        
        XCTAssertNotEqual(actionMovie1, actionMovie2)
    }
    
    func testEquitable_ReturnsNotEqualForDifferentReleaseDate() {
        let actionMovie1 = Movie(title: "Action", releaseDate: "1990")
        let actionMovie2 = Movie(title: "Adventure", releaseDate: "2010")
        
        XCTAssertNotEqual(actionMovie1.releaseDate, actionMovie2.releaseDate)
    }
    
    //MARK:- Clear Arrays
    func testClearArrays_ReturnArrayCountsOfZero() {
        sut.addMovie(movie: scifiMovie)
        sut.addMovie(movie: adventureMovie)
        sut.checkOffMovieAtIndex(index: 0)
        
        XCTAssertEqual(sut.moviesToSeeCount, 1)
        XCTAssertEqual(sut.moviesSeenCount, 1)
        
        sut.clearArrays()
        
        XCTAssertEqual(sut.moviesToSeeCount, 0)
        XCTAssertEqual(sut.moviesSeenCount, 0)
    }
    
    //MARK:- Duplicates
    func testDuplicateMovies_ShouldNotBeAddedToArray() {
        sut.addMovie(movie: scifiMovie)
        sut.addMovie(movie: scifiMovie)
        
        XCTAssertEqual(sut.moviesToSeeCount, 1)
    }
}
