//
//  MainViewController.swift
//  SampleScrollViewController
//
//  Created by Hemanta Sapkota on 19/08/2015.
//  Copyright (c) 2015 Hemanta Sapkota. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class MainViewController : UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "ScrollViewController w/AutoLayout(SnapKit)"

        let mainView = MainView()

        mainView.viewPusher = { vc in
            self.navigationController?.pushViewController(vc, animated: true)
        }

        view = mainView
    }

}

class MainView : UIView, UITableViewDelegate, UITableViewDataSource {

    var tableView: UITableView!

    var menuItems = ["Image Scroll View", "Scrolling UIView"]

    var viewPusher: ((UIViewController)->Void)?

    init() {
        super.init(frame: UIScreen.mainScreen().bounds)

        tableView = UITableView(frame: UIScreen.mainScreen().bounds)
        tableView.registerClass(MainViewCell.self, forCellReuseIdentifier: "Cell")

        tableView.delegate = self
        tableView.dataSource = self

        addSubview(tableView)
        tableView.snp_makeConstraints { (make) -> Void in
            make.edges.equalTo(self.snp_edges)
        }
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! MainViewCell
        cell.textLabel?.text = menuItems[indexPath.item]
        return cell
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.item == 0 {
            viewPusher!(ImageScrollViewController())
        } else if indexPath.item == 1 {
            viewPusher!(ScrollingViewController())
        }
    }

}

class MainViewCell : UITableViewCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

