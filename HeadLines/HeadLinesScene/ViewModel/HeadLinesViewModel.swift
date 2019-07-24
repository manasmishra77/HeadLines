//
//  HeadLinesViewModel.swift
//  HeadLines
//
//  Created by Manas Mishra on 24/07/19.
//  Copyright © 2019 manas. All rights reserved.
//

import UIKit

class HeadLinesViewModel: NSObject {
    
    private var headLineModel: HeadLinesModel?
    
    var numberOfItems: Int {
        return headLineModel?.articles?.count ?? 0
    }
    
    func getItem(for index: Int) -> Articles? {
      let article = headLineModel?.articles?[index]
        return article
    }
    
    func fetchHeadLines(completion: @escaping SuccessCompletionBlock) {
        NetworkManager.getHeadLines {[weak self] (isSuccess, model) in
            self?.headLineModel = model
            DispatchQueue.main.async {
                completion(isSuccess)
            }
        }
    }

}
