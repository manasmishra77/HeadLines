//
//  Source+CoreDataProperties.swift
//  HeadLines
//
//  Created by Manas Mishra on 25/07/19.
//  Copyright © 2019 manas. All rights reserved.
//
//

import Foundation
import CoreData


extension Source {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Source> {
        return NSFetchRequest<Source>(entityName: "Source")
    }

//    @NSManaged public var id: String?
//    @NSManaged public var name: String?

}
