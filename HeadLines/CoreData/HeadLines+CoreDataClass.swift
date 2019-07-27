//
//  HeadLines+CoreDataClass.swift
//  HeadLines
//
//  Created by Manas Mishra on 27/07/19.
//  Copyright © 2019 manas. All rights reserved.
//
//

import Foundation
import CoreData


public class HeadLines: NSManagedObject {
    var ariclesArray: [Articles]? {
        guard let articlesData = self.articles as Data? else {return nil}
        do {
            let articles = try JSONDecoder().decode([Articles].self, from: articlesData)
            return articles
        } catch {
            print(error)
        }
        return nil
    }
}
