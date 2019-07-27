//
//  HeadLines+CoreDataProperties.swift
//  HeadLines
//
//  Created by Manas Mishra on 27/07/19.
//  Copyright © 2019 manas. All rights reserved.
//
//

import Foundation
import CoreData


extension HeadLines {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<HeadLines> {
        return NSFetchRequest<HeadLines>(entityName: "HeadLines")
    }

    @NSManaged public var articles: NSData?
    @NSManaged public var status: String?
    

}
