//
//  ViewController.swift
//  UILabel
//
//  Created by mac on 2017/4/21.
//  Copyright © 2017年 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let testLabel:UILabel = UILabel(frame: CGRect(x: 10, y: 10, width: 100, height: 20))
        testLabel.text = "this swift3.0 the first label";
        testLabel.font = UIFont(name: "Arial", size: 20)
        testLabel.textAlignment = NSTextAlignment.center
        testLabel.textColor = UIColor.purple
        testLabel.backgroundColor = UIColor.yellow
        testLabel.numberOfLines = 0
        //截取字符串显示
       // testLabel.lineBreakMode = NSLineBreakMode.byTruncatingHead
        
        testLabel.allowsDefaultTighteningForTruncation = true
        
        //阴影
        testLabel.shadowColor = UIColor.lightGray
        testLabel.shadowOffset = CGSize(width: 2, height: 2)
     
        
        self.view.addSubview(testLabel)
        
     
        
        
        
  
        
    }

       //计算文本size的方法 对于oc
    func getTextRectSize(text:NSString, font:UIFont,size:CGSize) -> CGRect {
        let attributes = [NSFontAttributeName:font]
        let option = NSStringDrawingOptions.usesLineFragmentOrigin
        let rect = text.boundingRect(with: size, options: option, attributes: attributes, context: nil)
        return rect
        
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

