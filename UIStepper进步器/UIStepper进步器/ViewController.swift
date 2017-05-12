//
//  ViewController.swift
//  UIStepper进步器
//
//  Created by mac on 2017/5/9.
//  Copyright © 2017年 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let  rect = CGRect(x: 20, y: 20, width: 80, height: 80)
        let stepper = UIStepper(frame: rect)
  
        self.view.addSubview(stepper)
        
        //当前值
        stepper.value = 1
        //最小值和最大值
        stepper.minimumValue = 0
        stepper.maximumValue = 10
        //步jin(每按一下加或者减，增加/减少的值
        stepper.stepValue = 1
        //核心方法 添加点击事件
        stepper.addTarget(self, action: #selector(stepperAction), for: .valueChanged)
        
        //设置值是否连续改变(按住不放的时候)
        stepper.isContinuous = true
        //设置是否重复（false -> 按住不放的时候不计数; ture ->按住不放的时候计数）
        stepper.autorepeat = false
        
        //设置填充颜色
        stepper.tintColor = UIColor.red
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func stepperAction()  {
        print("stepper值改变了")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

