//
//  ViewController.swift
//  UIAlertView
//
//  Created by mac on 2017/5/9.
//  Copyright © 2017年 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let alertView = UIAlertController.init(title: nil, message:"消息", preferredStyle:.alert )
        //参数1:需要显示的视图控制
        
    
        let okAction = UIAlertAction(title: "确定", style: .default ,handler:
        { (UIAlertAction)-> Void in
            print("确定点击事件")
        })
        
        
        
        let cancelAction = UIAlertAction(title: "取消", style: .cancel,handler:nil)
        
        
        alertView.addAction(okAction)
        alertView.addAction(cancelAction)
        self.present(alertView, animated: true, completion: nil)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

