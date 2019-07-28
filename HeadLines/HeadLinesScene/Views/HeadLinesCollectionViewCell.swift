//
//  HeadLinesCollectionViewCell.swift
//  HeadLines
//
//  Created by Manas Mishra on 24/07/19.
//  Copyright © 2019 manas. All rights reserved.
//

import UIKit
import Kingfisher


class HeadLinesCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var newsImageGradientView: ImageGradientView!
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var newsHeadingLabel: UILabel!
    @IBOutlet weak var newsSourceLabel: UILabel!
    @IBOutlet weak var newsDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        applyGradientToImageGradientView()
        self.newsImageView.clipsToBounds = true
        self.layer.cornerRadius = Size.HeadlinesVC.cellCornerRadius
    }
    
    override func prepareForReuse() {
        newsHeadingLabel.text = ""
        newsSourceLabel.text = ""
        newsDateLabel.text = ""
    }
    
    func configureCell(_ article: Articles?) {
        newsHeadingLabel.text = article?.title
        newsSourceLabel.text = article?.source?.name
        newsDateLabel.text = Utility.convertUTCDateToDateString(article?.publishedAt)
        if let imageUrlString = article?.urlToImage, let imageUrl = URL(string: imageUrlString) {
            newsImageView.kf.setImage(with: imageUrl)
        }
    }
    
    //Applying gradient to Image
    private func applyGradientToImageGradientView() {
        self.newsImageGradientView.clipsToBounds = true
        guard let gradientLayer = self.newsImageGradientView.layer as? CAGradientLayer  else { return }
        gradientLayer.applyGradient(initialColor: UIColor.clear.cgColor, finalColor: UIColor.black.cgColor)
    }
}


class ImageGradientView: UIView {
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
}
