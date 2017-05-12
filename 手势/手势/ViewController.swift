//
//  ViewController.swift
//  手势
//
//  Created by mac on 2017/5/10.
//  Copyright © 2017年 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var imageView : UIImageView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let rect = CGRect(x: 0, y: 80, width: 320, height: 320)
        self.imageView = UIImageView(frame: rect)
        self.imageView.backgroundColor = UIColor.red
        let image = UIImage(named: "")
        self.imageView.image = image
        self.imageView.isUserInteractionEnabled = true
        self.view.addSubview(self.imageView)
        
        let guesture = UITapGestureRecognizer(target: self, action: #selector(singleTap(_:)) )
        
        self.imageView.addGestureRecognizer(guesture)
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    
    func singleTap(_ sender:UITapGestureRecognizer) -> Void {
        print("单击手势")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

