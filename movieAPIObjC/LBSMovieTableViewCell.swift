//
//  LBSMovieTableViewCell.swift
//  movieAPIObjC
//
//  Created by tyson ericksen on 12/6/19.
//  Copyright © 2019 tyson ericksen. All rights reserved.
//

import UIKit

class LBSMovieTableViewCell: UITableViewCell {
    
    var movies: LBSMovie? {
        didSet {
            updateViews()
        }
    }

    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var ratingsLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var moviePosterImage: UIImageView!
    
    
    func updateViews(){
        guard let movie = movies else { return }
        LBSMovieController.fetchPoster(with: movie) { (poster, _) in
            DispatchQueue.main.async {
                self.moviePosterImage.image = 
            }
        }
        movieTitleLabel.text = movie.title
        overviewLabel.text = movie.overview
        ratingsLabel.text = "\(movie.vote_average)"
    }
    
}
