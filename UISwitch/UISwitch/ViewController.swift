//
//  ViewController.swift
//  UISwitch
//
//  Created by mac on 2017/4/21.
//  Copyright © 2017年 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let rect = CGRect(x:30,y:30,width:50,height:50)
        
        let uiSwitch = UISwitch(frame:rect)
        
        uiSwitch.setOn(true,animated:true)
        
        //开发使用
        uiSwitch.thumbTintColor = UIColor.white
        uiSwitch.tintColor = UIColor.brown
        uiSwitch.onTintColor = UIColor.green
        
        uiSwitch.addTarget(self, action: #selector(ViewController.swtichAction), for: UIControlEvents.valueChanged)
        self.view.addSubview(uiSwitch)
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    func swtichAction() {
        print("switchChange")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

