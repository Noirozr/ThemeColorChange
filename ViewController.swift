//
//  ViewController.swift
//  ThemeColorChange
//
//  Created by Noirozr on 15/6/13.
//  Copyright (c) 2015年 Yongjia Liu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var colorView: HSVView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.setColor(171, green: 36, blue: 10)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func change(sender: AnyObject) {
        
        colorView.changeTheme(306)
    }

}

