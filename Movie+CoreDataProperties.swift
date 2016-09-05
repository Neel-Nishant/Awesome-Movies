//
//  Movie+CoreDataProperties.swift
//  Awesome Movies
//
//  Created by Neel Nishant on 05/09/16.
//  Copyright © 2016 Neel Nishant. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Movie {

    @NSManaged var image: NSData?
    @NSManaged var title: String?
    @NSManaged var desc: String?
    @NSManaged var link: String?

}
