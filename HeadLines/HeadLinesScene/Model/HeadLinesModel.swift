//
//  HeadLinesModel.swift
//  HeadLines
//
//  Created by Manas Mishra on 24/07/19.
//  Copyright © 2019 manas. All rights reserved.
//

import Foundation
import CoreData


public class HeadLines : NSManagedObject, Codable {
    @NSManaged public var status : String?
    //@NSManaged public var totalResults : Int32?
    @NSManaged public var articles : [Articles]?
    
    enum CodingKeys: String, CodingKey {
        
        case status = "status"
       // case totalResults = "totalResults"
        case articles = "articles"
    }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(status, forKey: .status)
       // try container.encode(totalResults, forKey: .totalResults)
        try container.encode(articles, forKey: .articles)
    }
    
    required public init(from decoder: Decoder) throws {
        let moc = CoreDataStack.sharedInstance.managedObjectContext
        let entityDesc = NSEntityDescription.entity(forEntityName: "HeadLines", in: moc)
        super.init(entity: entityDesc!, insertInto: moc)
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(String.self, forKey: .status)
       // totalResults = try values.decodeIfPresent(Int32.self, forKey: .totalResults)
        articles = try values.decodeIfPresent([Articles].self, forKey: .articles)
    }
    
}

public class Articles : NSManagedObject, Codable {
    @NSManaged public var source : Source?
    @NSManaged public var author : String?
    @NSManaged public var title : String?
    @NSManaged public var descriptionOfContent : String?
    @NSManaged public var url : String?
    @NSManaged public var urlToImage : String?
    @NSManaged public var publishedAt : String?
    @NSManaged public var content : String?
    
    enum CodingKeys: String, CodingKey {
        case source = "source"
        case author = "author"
        case title = "title"
        case descriptionOfContent = "description"
        case url = "url"
        case urlToImage = "urlToImage"
        case publishedAt = "publishedAt"
        case content = "content"
    }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(source, forKey: .source)
        try container.encode(author, forKey: .author)
        try container.encode(title, forKey: .title)
        try container.encode(descriptionOfContent, forKey: .descriptionOfContent)
        try container.encode(url, forKey: .url)
        try container.encode(urlToImage, forKey: .urlToImage)
        try container.encode(publishedAt, forKey: .publishedAt)
    }
    
    required public init(from decoder: Decoder) throws {
        let moc = CoreDataStack.sharedInstance.managedObjectContext
        let entityDesc = NSEntityDescription.entity(forEntityName: "Articles", in: moc)
        super.init(entity: entityDesc!, insertInto: moc)
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        source = try values.decodeIfPresent(Source.self, forKey: .source)
        author = try values.decodeIfPresent(String.self, forKey: .author)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        descriptionOfContent = try values.decodeIfPresent(String.self, forKey: .descriptionOfContent)
        url = try values.decodeIfPresent(String.self, forKey: .url)
        urlToImage = try values.decodeIfPresent(String.self, forKey: .urlToImage)
        publishedAt = try values.decodeIfPresent(String.self, forKey: .publishedAt)
        content = try values.decodeIfPresent(String.self, forKey: .content)
    }
    
}


public class Source : NSManagedObject, Codable {
    @NSManaged public var  id : String?
    @NSManaged public var name : String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(id, forKey: .id)
    }
    required public init(from decoder: Decoder) throws {
        let moc = CoreDataStack.sharedInstance.managedObjectContext
        let entityDesc = NSEntityDescription.entity(forEntityName: "Source", in: moc)
        super.init(entity: entityDesc!, insertInto: moc)
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
    }
    
}
