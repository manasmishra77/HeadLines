//
//  NetworkManager.swift
//  HeadLines
//
//  Created by Manas Mishra on 24/07/19.
//  Copyright © 2019 manas. All rights reserved.
//

import UIKit


class NetworkManager: NSObject {
    class func getHeadLines(completion: ResponseSuccessBlock?) {
        let urlString = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=6170b8c935cf46a396bb7398a8141515"
        guard let url = URL(string: urlString) else {
            completion?(false, nil)
            return
        }
        let request = URLRequest(url: url)
        let datatask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard error != nil, let response = response as? HTTPURLResponse, response.statusCode == 200, let data = data else {
                completion?(false, nil)
                return
            }
            if let model = try? JSONDecoder().decode(HeadLinesModel.self, from: data) {
                completion?(true, model)
                return
            }
            completion?(false, nil)
        }
        datatask.resume()
    }
}
