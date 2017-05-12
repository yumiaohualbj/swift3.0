//
//  ViewController.swift
//  UISegmentedControl多段选择器
//
//  Created by mac on 2017/5/9.
//  Copyright © 2017年 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let segmentCtr  = UISegmentedControl.init(items:["1","2","3"])
        segmentCtr.frame = CGRect(x: 100, y: 400, width: 200, height: 50)
        self.view .addSubview(segmentCtr)
        
        
        //当前选中的分段的下标(从0开始)
        segmentCtr.selectedSegmentIndex = 0
        //添加点击事件
        segmentCtr.addTarget(self, action: #selector(segmentAction(segment:)), for: .valueChanged)
        
        //拿到分段选择的分段数
        
        print(segmentCtr.numberOfSegments)
        
        //设置填充颜色
        segmentCtr.tintColor = UIColor.blue
        // Do any additional setup after loading the view, typically from a nib.
    }

    
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
               // Dispose of any resources that can be recreated.
    }


}


extension ViewController{
    
    func segmentAction(segment:UISegmentedControl)  {
     print(segment.selectedSegmentIndex)
    print(segment.titleForSegment(at: segment.selectedSegmentIndex))
    }
}
