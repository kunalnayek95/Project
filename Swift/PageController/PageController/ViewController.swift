//
//  ViewController.swift
//  PageController
//
//  Created by Kunal's MacBook on 26/10/21.
//

import UIKit
import FlexiblePageControl

class ViewController: UIViewController {

    @IBOutlet weak var pageControllerView: UIView!
    let pageControl = FlexiblePageControl()
     var page = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        pageControl.numberOfPages = 10
        pageControllerView.addSubview(pageControl)
        pageControl.center = CGPoint(x: pageControllerView.frame.size.width  / 2,
                                     y: pageControllerView.frame.size.height / 2)

        
        // color
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        pageControl.currentPageIndicatorTintColor = UIColor.red

        // size
        let config = FlexiblePageControl.Config(
            displayCount: 5,
            dotSize: 10,
            dotSpace: 5,
            smallDotSizeRatio: 0.5,
            mediumDotSizeRatio: 0.7
        )

        pageControl.setConfig(config)

    }


    @IBAction func nextBtn(_ sender: Any) {
        page += 1
        pageControl.setCurrentPage(at: page)
    }
}

//func scrollViewDidScroll(_ scrollView: UIScrollView) {
//    pageControl.setProgress(contentOffsetX: scrollView.contentOffset.x, pageWidth: scrollView.bounds.width)
//}

