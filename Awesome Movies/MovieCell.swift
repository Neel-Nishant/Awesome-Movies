//
//  MovieCell.swift
//  Awesome Movies
//
//  Created by Neel Nishant on 05/09/16.
//  Copyright © 2016 Neel Nishant. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet weak var movTitle: UILabel!
    @IBOutlet weak var movdesc: UILabel!
    @IBOutlet weak var movImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        movImg.layer.cornerRadius = movImg.frame.size.width/2
        movImg.clipsToBounds = true
    }

    func configureCell(movie: Movie)
    {
        movTitle.text = movie.title
        movdesc.text = movie.desc
        movImg.image = movie.getMovieImage()
    }

}
