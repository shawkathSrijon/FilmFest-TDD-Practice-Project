//
//  LibraryViewController.swift
//  FilmFest
//
//  Created by Simec Sys Ltd. on 25/1/21.
//

import UIKit

class LibraryViewController: UIViewController {
    @IBOutlet weak var libraryTableView: UITableView!
    @IBOutlet var dataService: MovieLibraryDataService!
    
    var movieManager = MovieManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.libraryTableView.dataSource = dataService
        self.libraryTableView.delegate = dataService
        
        dataService.movieManager = movieManager
        
        dataService.movieManager?.addMovie(movie: Movie(title: "Action", releaseDate: "1999"))
        dataService.movieManager?.addMovie(movie: Movie(title: "Horror", releaseDate: "1989"))
        dataService.movieManager?.addMovie(movie: Movie(title: "Crime Thriller", releaseDate: "2005"))
        dataService.movieManager?.addMovie(movie: Movie(title: "Indie Comedy", releaseDate: "2000"))
        dataService.movieManager?.addMovie(movie: Movie(title: "Kung Fu Flick"))
        
        libraryTableView.reloadData()
    }
}

