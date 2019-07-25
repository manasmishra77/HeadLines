//
//  Articles+CoreDataProperties.swift
//  HeadLines
//
//  Created by Manas Mishra on 25/07/19.
//  Copyright © 2019 manas. All rights reserved.
//
//

import Foundation
import CoreData


extension Articles {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Articles> {
        return NSFetchRequest<Articles>(entityName: "Articles")
    }

//    @NSManaged public var author: String?
//    @NSManaged public var title: String?
//    @NSManaged public var descriptionOfContent: String?
//    @NSManaged public var url: String?
//    @NSManaged public var urlToImage: String?
//    @NSManaged public var publishedAt: String?
//    @NSManaged public var content: String?
//    @NSManaged public var source: Source?

}
