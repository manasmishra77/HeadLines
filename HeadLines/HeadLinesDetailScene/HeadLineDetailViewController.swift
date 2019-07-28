//
//  HeadLineDetailViewController.swift
//  HeadLines
//
//  Created by Manas Mishra on 24/07/19.
//  Copyright © 2019 manas. All rights reserved.
//

import UIKit

class HeadLineDetailViewController: UIViewController {
    
    var viewModel: HeadLineDetailViewModel!
    
    @IBOutlet weak var bgImageGradient: ImageGradientView!
    @IBOutlet weak var headlineDetailBGImageView: UIImageView!
    @IBOutlet weak var desrptionHeadlinesLabel: UILabel!
    @IBOutlet weak var sourceLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var headlineLabel: UILabel!
    
    var originFrame: CGRect!
    convenience init(article: Articles) {
        self.init()
        viewModel = HeadLineDetailViewModel(article)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureViews()
    }
    
    func present() {
        self.originFrame = self.view.frame
        UIView.animate(withDuration: 0.3, animations: {
            self.view.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
            self.view.alpha = 1
        }) { (_) in
        }
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        dismissVC()
    }
    
    func dismissVC() {
        desrptionHeadlinesLabel.isHidden = true
        sourceLabel.isHidden = true
        dateLabel.isHidden = true
        headlineLabel.isHidden = true
        UIView.animate(withDuration: 0.3, animations: {
            self.view.frame = self.originFrame
            self.view.layoutIfNeeded()
            //self.view.alpha = 0
        }) { (_) in
            self.willMove(toParent: nil)
            self.view.removeFromSuperview()
            self.removeFromParent()
        }
    }
    
    private func configureViews() {
        self.applyGradientToImageGradientView()
        desrptionHeadlinesLabel.text = viewModel.contentDesc
        sourceLabel.text = viewModel.source
        dateLabel.text = viewModel.publishingDate
        headlineLabel.text = viewModel.headlines
        if let imgUrl = viewModel.bgImageUrl {
            headlineDetailBGImageView.kf.setImage(with: imgUrl)
        }
    }
    
    //Applying gradient to Image
    private func applyGradientToImageGradientView() {
        guard let gradientLayer = self.bgImageGradient.layer as? CAGradientLayer  else { return }
        gradientLayer.applyGradient(initialColor: UIColor.clear.cgColor, finalColor: UIColor.black.cgColor)
    }
    


}
