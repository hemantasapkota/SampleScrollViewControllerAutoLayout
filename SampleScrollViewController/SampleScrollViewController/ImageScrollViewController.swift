//
//  ViewController.swift
//  SampleScrollViewController
//
//  Created by Hemanta Sapkota on 9/07/2015.
//  Copyright (c) 2015 Hemanta Sapkota. All rights reserved.
//

import UIKit
import SnapKit

class ImageScrollViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Muktinath"

        view.backgroundColor = UIColor.whiteColor()

        let scrollView = UIScrollView()

        let imageView = UIImageView(image: UIImage(named: "mukti-bg.jpg"))

        scrollView.setTranslatesAutoresizingMaskIntoConstraints(false)
        imageView.setTranslatesAutoresizingMaskIntoConstraints(false)

        view.addSubview(scrollView)
        scrollView.snp_makeConstraints { (make) -> Void in
            make.edges.equalTo(view.snp_edges)
        }

        scrollView.addSubview(imageView)
        imageView.snp_makeConstraints { (make) -> Void in
            make.edges.equalTo(scrollView.snp_edges)

            //Make sure that imaveView or any uiview has width and height property set
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

