//
//  ViewController.swift
//  Awesome Movies
//
//  Created by Neel Nishant on 03/09/16.
//  Copyright © 2016 Neel Nishant. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tView: UITableView!

    
    var movies = [Movie]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tView.delegate = self
        tView.dataSource = self
    }
    
    override func viewDidAppear(animated: Bool) {
        fetchAndSetResults()
        tView.reloadData()
    }
    
    func fetchAndSetResults(){
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = app.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Movie")
        
        do{
            let results = try context.executeFetchRequest(fetchRequest)
            self.movies = results as! [Movie]
        }
        catch let err as NSError
        {
            print(err.debugDescription)
        }
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if let cell = tView.dequeueReusableCellWithIdentifier("MovieCell") as? MovieCell
        {
            let movie = movies[indexPath.row]
            cell.configureCell(movie)
            return cell
        }
        else
        {
            return MovieCell()
        }
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "DetailVC"
        {
            if let cell = sender as? MovieCell, row = tView.indexPathForCell(cell)?.row, vc = segue.destinationViewController as? DetailVC {
                vc.movie = movies[row]
                
            }
        }
    }
    
}

