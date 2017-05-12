//
//  ViewController.swift
//  自定义cell
//
//  Created by mac on 2017/5/10.
//  Copyright © 2017年 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screenRect = UIScreen.main.bounds
        let tableRect = CGRect(x: 0, y: 20, width: screenRect.size.width, height: screenRect.size.height)
        let tableView  = UITableView(frame: tableRect)
        tableView.dataSource = self
        self.view.addSubview(tableView)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identy = "reusedCell"
//        var cell = tableView.dequeueReusableCell(withIdentifier: identy)
        
        var cell:TestCell? = tableView.dequeueReusableCell(withIdentifier: identy) as? TestCell
        
        if (cell == nil) {
            
            cell = TestCell(style: UITableViewCellStyle.default, reuseIdentifier: identy)
//            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: identy)
        }
        
        cell?.title?.text = "客户姓名"
//        cell?.textLabel?.text = "命运负责洗牌，玩牌的是我们自己"
        
        return cell!
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

