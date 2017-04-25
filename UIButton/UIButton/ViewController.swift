//
//  ViewController.swift
//  UIButton
//
//  Created by mac on 2017/4/21.
//  Copyright © 2017年 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let button: UIButton = UIButton(type:UIButtonType.custom);
        button.setTitle("BTN1", for: UIControlState.normal)
        button.frame=CGRect(x: 10, y: 10, width: 50, height: 30)
        button.backgroundColor = UIColor.red
        button.addTarget(self, action: #selector(clickAction(btn:)), for: UIControlEvents.touchUpInside)
        self.view.addSubview(button);
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    func clickAction(btn:UIButton)  {
        print("按钮被点击")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

