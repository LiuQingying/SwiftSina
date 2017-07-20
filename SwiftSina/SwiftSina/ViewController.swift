//
//  ViewController.swift
//  SwiftSina
//
//  Created by 营 on 2017/7/16.
//  Copyright © 2017年 营. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       let view = UIView.init(frame: CGRect.init(x: 10, y: 20, width: 100, height: 100))
        view.backgroundColor = UIColor.red
        self.view.addSubview(view)
        let label = UILabel.init(frame: CGRect.init(x: view.frame.origin.x, y: view.frame.maxY+10, width: self.view.frame.size.width-20, height: 30))
        label.layer.cornerRadius = 4
        label.text = "文本框"
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 15)
        self.view.addSubview(label)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

