//
//  HeadLineDetailViewModel.swift
//  HeadLines
//
//  Created by Manas Mishra on 24/07/19.
//  Copyright © 2019 manas. All rights reserved.
//

import UIKit

class HeadLineDetailViewModel: NSObject {
    var article: Articles!
    init(_ article: Articles) {
        self.article = article
        super.init()
    }
    
    var headlines: String {
        return article.title ?? ""
    }
    var publishingDate: String {
        return Utility.convertUTCDateToDateString(article.publishedAt) ?? ""
    }
    var source: String {
        return article.source?.name ?? ""
    }
    var contentDesc: String {
        return article.descriptionOfContent ?? ""
    }
    
    var bgImageUrl: URL? {
        if let urlStr = article.urlToImage, let url = URL(string: urlStr) {
            return url
        }
        return nil
    }
    

}
