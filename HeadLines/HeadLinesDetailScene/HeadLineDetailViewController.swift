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
        self.view.backgroundColor = .red
    }
    
    func present() {
        self.originFrame = self.view.frame
        self.view.alpha = 0
        toggleVisibilityOfIcon(toHide: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: {
                self.view.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
                self.view.superview?.layoutIfNeeded()
                self.view.alpha = 1
            }, completion: { (_) in
                self.toggleVisibilityOfIcon(toHide: false)
            })
        }
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        dismissVC()
    }
    
    func dismissVC() {
        toggleVisibilityOfIcon(toHide: true)
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
    
   private func toggleVisibilityOfIcon(toHide: Bool) {
        desrptionHeadlinesLabel.isHidden = toHide
        sourceLabel.isHidden = toHide
        dateLabel.isHidden = toHide
        headlineLabel.isHidden = toHide
    }
    
    private func configureViews() {
        self.headlineDetailBGImageView.clipsToBounds = true
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
