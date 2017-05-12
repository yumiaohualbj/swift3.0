//
//  ViewController.swift
//  UIProgress
//
//  Created by mac on 2017/5/9.
//  Copyright © 2017年 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rect = CGRect(x: 100, y: 200, width: 100, height: 30)
        let progress = UIProgressView(frame: rect)
        progress.tag = 100
        self.view.addSubview(progress)
        
        //进度0-1
        progress.progress = 0.5
        
        
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

