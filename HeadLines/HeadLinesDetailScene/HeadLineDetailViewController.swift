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
    
    @IBOutlet weak var headlineDetailBGImageView: UIImageView!
    @IBOutlet weak var desrptionHeadlinesLabel: UILabel!
    @IBOutlet weak var sourceLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var headlineLabel: UILabel!
    
    var originFrame: CGRect!
    convenience init(article: Articles) {
        viewModel = HeadLineDetailViewModel(article)
        self.init()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func present() {
        self.originFrame = self.view.frame
        UIView.animate(withDuration: 0.3, animations: {
            self.view.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
            self.view.alpha = 1
        }) { (_) in
        }
    }
    
    func dismissVC() {
        UIView.animate(withDuration: 0.3, animations: {
            self.view.frame = self.originFrame
            self.view.alpha = 0
        }) { (_) in
            self.willMove(toParent: nil)
            self.view.removeFromSuperview()
            self.removeFromParent()
        }
    }
    
    private func configureViews() {
        
        
    }
    


}
