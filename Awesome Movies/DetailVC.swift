//
//  DetailVC.swift
//  Awesome Movies
//
//  Created by Neel Nishant on 05/09/16.
//  Copyright © 2016 Neel Nishant. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {

    @IBOutlet weak var movTitle: UILabel!
    @IBOutlet weak var movDesc: UILabel!
    @IBOutlet weak var movLink: UILabel!
    @IBOutlet weak var movImg: UIImageView!
    
    var movie: Movie?
    override func viewDidLoad() {
        super.viewDidLoad()

        if let theMovie = movie{
            movTitle.text = theMovie.title
            movDesc.text = theMovie.desc
            movLink.text = theMovie.link
            movImg.image = theMovie.getMovieImage()
            movImg.layer.cornerRadius = movImg.frame.size.height/2
            movImg.clipsToBounds = true
        }
    }

   

}
