//
//  LBSMovieTableViewController.swift
//  movieAPIObjC
//
//  Created by tyson ericksen on 12/6/19.
//  Copyright © 2019 tyson ericksen. All rights reserved.
//

import UIKit

class LBSMovieTableViewController: UITableViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var movies: [LBSMovie] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text else { return }
        LBSMovieController.fetchMovie(withSearchTerm: searchTerm) { (movies, _) in
            DispatchQueue.main.async {
                self.movies = movies
            }
        }
    }
    

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as? LBSMovieTableViewCell else { return UITableViewCell() }

        let movie = movies[indexPath.row]
        cell.movies = movie

        return cell
    }
}


