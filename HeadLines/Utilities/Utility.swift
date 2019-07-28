//
//  Utility.swift
//  HeadLines
//
//  Created by Manas Mishra on 23/07/19.
//  Copyright © 2019 manas. All rights reserved.
//

import UIKit

typealias ResponseSuccessBlock = (_ isSuccess: Bool, _ model: HeadLinesModel?) -> Void
typealias SuccessCompletionBlock   = (_ isSuccess: Bool) -> Void

let HeadlinesCellNibIdentifier = "HeadLinesCollectionViewCell"

// Screen width.
public var screenWidth: CGFloat {
    return UIScreen.main.bounds.width
}

// Screen width.
public var screenHeight: CGFloat {
    return UIScreen.main.bounds.height
}

extension UIView {
    func addFourConstraints(_ superview: UIView, top: CGFloat = 0, bottom: CGFloat = 0, leading: CGFloat = 0, trailing: CGFloat = 0) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: superview.topAnchor, constant: top).isActive = true
        self.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: bottom).isActive = true
        self.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: leading).isActive = true
        self.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: trailing).isActive = true
    }
}


class Utility {
    static let shared = Utility()
    private init() {}
    
    //Converting the datestring from server response to required fromat
    class func convertUTCDateToDateString(_ dateString: String?) -> String? {
        guard let dateString = dateString else { return nil }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
        guard let date = dateFormatter.date(from: dateString) else { return nil }
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.timeZone = TimeZone.current
        let localString = dateFormatter.string(from: date)
        return localString
    }
    
   
}

//This will provide sizes for all the viewcontroller related views
struct Size {
    struct HeadlinesVC {
        static var collectionViewSectionInset: UIEdgeInsets {
            return UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        }
        static var collectionViewItemSize: CGSize {
            let width = screenWidth - 32
            let height: CGFloat = width*0.55
            return CGSize(width: width, height: height)
        }
        static var collectionViewLineSpacing: CGFloat {
            return 20
        }
        
    }
    struct HeadlineDetailVC {
        
    }
}

// Add Gradient
extension CAGradientLayer {
    // MARK: Apply Gradient
    func applyGradient(initialColor : CGColor, finalColor: CGColor) {
        let initalColor  = initialColor
        let finalColor = finalColor
        
        let colorsArray = [initalColor, finalColor]
        let layer = self
        layer.colors = colorsArray
        layer.frame = self.bounds
        layer.startPoint = CGPoint(x: 0.0, y: 0.0)
        layer.endPoint = CGPoint(x: 0.0, y: 1.0)
//        self.layer.insertSublayer(layer, at: 0)
    }
}
