//
//  ScrollingUIView.swift
//  SampleScrollViewController
//
//  Created by Hemanta Sapkota on 19/08/2015.
//  Copyright (c) 2015 Hemanta Sapkota. All rights reserved.
//

import Foundation
import UIKit

class ScrollingViewController : UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let scrollView = UIScrollView()
        let view1 = View1()

        scrollView.setTranslatesAutoresizingMaskIntoConstraints(false)
        view1.setTranslatesAutoresizingMaskIntoConstraints(false)

        view.addSubview(scrollView)
        scrollView.snp_makeConstraints { (make) -> Void in
            make.edges.equalTo(view.snp_edges)
        }

        scrollView.addSubview(view1)
        view1.snp_makeConstraints { (make) -> Void in
            make.edges.equalTo(scrollView.snp_edges)

            //Make sure that imaveView or any uiview has width and height property set
            make.width.equalTo(UIScreen.mainScreen().bounds.width)
            make.height.equalTo(view1.totalHeight)
        }
    }

}

class View1 : UIView {

    var totalHeight:CGFloat = 0

    let constHeight = 100

    init() {
        super.init(frame: UIScreen.mainScreen().bounds)

        backgroundColor = UIColor.whiteColor()

        var section = makeSection(nil)
        var i = 1

        while i++ <= 10 {
            section = makeSection(section)
        }

        totalHeight += 10.0
    }

    func makeSection(prevComponent: UIView?) -> UIView {
        let section = UIView()
        section.layer.cornerRadius = 5
        section.backgroundColor = UIColor(red: 0.3, green: 0.1, blue: 0.4, alpha: 1)
        addSubview(section)
        section.snp_makeConstraints { (make) -> Void in
            if let prevView = prevComponent {
                make.top.equalTo(prevView.snp_bottom).offset(10)
            } else {
                make.top.equalTo(10)
            }

            make.centerX.equalTo(self.snp_centerX)
            make.width.equalTo(self.snp_width).dividedBy(2)
            make.height.equalTo(constHeight)

            //Increment height
            self.totalHeight += CGFloat(constHeight + 10) //10 is for offset
        }
        return section
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}