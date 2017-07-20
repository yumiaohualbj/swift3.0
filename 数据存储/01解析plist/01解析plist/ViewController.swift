//
//  ViewController.swift
//  01解析plist
//
//  Created by 于淼华 on 2017/7/14.
//  Copyright © 2017年 于淼华. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let plistPath = Bundle.main.path(forResource: "demoPlist", ofType: "plist")
        //从plist文件中读取出数据
        let data:NSMutableDictionary = NSMutableDictionary.init(contentsOfFile: plistPath!)!
        let message = data.description
        let name = data["name"]
        let age = data["age"]
        
        print(message)
        print(name)
        print(age)

        
        
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

