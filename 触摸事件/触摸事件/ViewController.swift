//
//  ViewController.swift
//  触摸事件
//
//  Created by mac on 2017/5/10.
//  Copyright © 2017年 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var imageView :UIImageView!
    var isTouchInImageView: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let <#name#> = <#value#>
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        print("touchBegan")
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
         print("touchMove")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
         print("touchEnded")
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
         print("touchCancel")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

