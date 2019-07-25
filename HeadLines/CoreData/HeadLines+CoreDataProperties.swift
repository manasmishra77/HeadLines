//
//  HeadLines+CoreDataProperties.swift
//  HeadLines
//
//  Created by Manas Mishra on 25/07/19.
//  Copyright © 2019 manas. All rights reserved.
//
//

import Foundation
import CoreData


extension HeadLines {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<HeadLines> {
        return NSFetchRequest<HeadLines>(entityName: "HeadLines")
    }

//    @NSManaged public var totalResults: Int64
//    @NSManaged public var status: String?
//    @NSManaged public var articles: Articles?

}
