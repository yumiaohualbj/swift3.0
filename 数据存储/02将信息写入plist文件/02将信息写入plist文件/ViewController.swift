//
//  ViewController.swift
//  02将信息写入plist文件
//
//  Created by 于淼华 on 2017/7/14.
//  Copyright © 2017年 于淼华. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dataDic:NSMutableDictionary = NSMutableDictionary()
        
        dataDic.setObject("yu", forKey: "name" as NSCopying)
        dataDic.setObject(24, forKey: "age" as NSCopying)
        
        let plistPath = Bundle.main.path(forResource: "demoPlist", ofType: "plist")
        dataDic.write(toFile: plistPath!, atomically: true)
        
        let data:NSMutableDictionary = NSMutableDictionary.init(contentsOfFile: plistPath!)!
        let message = data.description
        print(plistPath)
        print(message)
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

