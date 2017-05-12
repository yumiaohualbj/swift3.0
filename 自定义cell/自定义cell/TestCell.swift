//
//  TestCell.swift
//  自定义cell
//
//  Created by mac on 2017/5/10.
//  Copyright © 2017年 mac. All rights reserved.
//

import UIKit

class TestCell: UITableViewCell {

    var userImg : UIImageView!
    var title : UILabel!
    var detail : UIButton!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.userImg = UIImageView(image: UIImage(named:"user"))
        self.userImg.center = CGPoint(x: 30, y: 22)
        self.title = UILabel(frame: CGRect(x: 80, y: 0, width: 120, height: 40))
        self.title.text = "自定义单元格"
        
        self.detail = UIButton (frame: CGRect(x: 240, y: 8, width: 60, height: 24))
        self.detail .setTitle("详情", for: UIControlState())
        self.detail.backgroundColor = UIColor.gray
        self.detail.addTarget(self, action: #selector(showDetail(_:)), for: UIControlEvents.touchUpInside)
        
        self.addSubview(self.userImg)
        self.addSubview(self.title)
        self.addSubview(self.detail)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func showDetail(_ sender:UIButton){
        
        print("显示详情")
    }
    
    
    
    
    
}
