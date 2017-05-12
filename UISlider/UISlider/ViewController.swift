//
//  ViewController.swift
//  UISlider
//
//  Created by mac on 2017/5/9.
//  Copyright © 2017年 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      
        self.view.backgroundColor = UIColor.white
        //创建滑条对象
        //UISlider:UIControl:UIView
        
        let rect = CGRect(x:30,y:30,width:50,height:50)
        let slider = UISlider(frame:rect)
        
        slider.value = 0.5
        slider.minimumValue = 0
        slider.maximumValue =  100
        slider.addTarget(self, action:#selector(sliderAction), for: UIControlEvents.valueChanged)
        self.view.addSubview(slider)
        
    
        
        
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func sliderAction() {
       print("滑块被拖动了")
    }

}

