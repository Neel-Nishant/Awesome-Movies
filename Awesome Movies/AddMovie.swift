//
//  AddMovie.swift
//  Awesome Movies
//
//  Created by Neel Nishant on 05/09/16.
//  Copyright © 2016 Neel Nishant. All rights reserved.
//

import UIKit
import CoreData

class AddMovie: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var movieTitle: UITextField!
    @IBOutlet weak var movieDesc: UITextField!
    @IBOutlet weak var movieLink: UITextField!
    @IBOutlet weak var movieImg: UIImageView!
    @IBOutlet weak var addMovieBtn: UIButton!
    
    
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        movieImg.layer.cornerRadius = 4.0
        movieImg.clipsToBounds = true
    }

    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        movieImg.image = image
        
    }

    @IBAction func addImage(sender: AnyObject!)
    {
        sender.setTitle("", forState: .Normal)
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    @IBAction func addMovie(sender: AnyObject!)
    {
        if let title = movieTitle.text where title != ""
        {
            let app = UIApplication.sharedApplication().delegate as! AppDelegate
            let context = app.managedObjectContext
            let entity = NSEntityDescription.entityForName("Movie", inManagedObjectContext: context)!
            let movie = Movie(entity: entity, insertIntoManagedObjectContext: context)
            movie.title = title
            movie.desc = movieDesc.text
            movie.link = movieLink.text
            movie.setMovieImage(movieImg.image!)
            
            context.insertObject(movie)
            
            do{
                try context.save()
            }
            catch{
                print("Could not save movie")
                
            }
            self.navigationController?.popViewControllerAnimated(true)
            
        }
    }
    
}
