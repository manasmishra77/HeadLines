//
//  HeadLinesViewController.swift
//  HeadLines
//
//  Created by Manas Mishra on 24/07/19.
//  Copyright © 2019 manas. All rights reserved.
//

import UIKit

class HeadLinesViewController: UIViewController {

    @IBOutlet weak var heightOfHeaderview: NSLayoutConstraint!
    @IBOutlet weak var hederView: UIView!
    @IBOutlet weak var headlinesCollectionView: UICollectionView!
    
    var viewModel: HeadLinesViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureViews()
    }
    
    private func configureViews() {
        viewModel = HeadLinesViewModel()
        self.configureCollectionView()
        viewModel.fetchHeadLines { (isSuccess) in
            if isSuccess {
                self.headlinesCollectionView.reloadData()
            } else {
                //Show error
            }
        }
    }

}

extension HeadLinesViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    private func configureCollectionView() {
        self.headlinesCollectionView.register(UINib(nibName: HeadlinesCellNibIdentifier, bundle: nil), forCellWithReuseIdentifier: HeadlinesCellNibIdentifier)
        self.headlinesCollectionView.delegate = self
        self.headlinesCollectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return Size.HeadlinesVC.collectionViewItemSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return Size.HeadlinesVC.collectionViewLineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return Size.HeadlinesVC.collectionViewSectionInset
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HeadlinesCellNibIdentifier, for: indexPath) as! HeadLinesCollectionViewCell
        cell.configureCell(viewModel.getItem(for: indexPath.row))
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.presentHeadLineDetailVC(indexPath: indexPath)
    }
    
    
}

//Helper function related to HeadlineVc
extension HeadLinesViewController {
    private func presentHeadLineDetailVC(indexPath: IndexPath) {
        guard let article = viewModel.getItem(for: indexPath.row) else {return}
        guard let cell = self.headlinesCollectionView.cellForItem(at: indexPath) else {return}
        let headlineDetailVC = HeadLineDetailViewController(article: article)
        self.addChild(headlineDetailVC)
        headlineDetailVC.view.alpha = 0
        headlineDetailVC.view.frame = cell.frame
        self.view.addSubview(headlineDetailVC.view)
        headlineDetailVC.didMove(toParent: self)
        headlineDetailVC.present()
    }
}
