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

}
