//
//  ViewController.swift
//  UITableView
//
//  Created by mac on 2017/4/24.
//  Copyright © 2017年 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.createTableView()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    func createTableView() -> Void {
       
        let tableView = UITableView(frame: self.view.frame, style: UITableViewStyle.grouped)
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        
        
    }
    
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}



extension ViewController:UITableViewDelegate,UITableViewDataSource{
    
    //mark：UITableViewDelegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            var cellId: String
            var cell: UITableViewCell? = nil
            var style: UITableViewCellStyle
            let image = UIImage (named: "cellImage")
            var text: String
            let detailText = "detail_text"
            switch indexPath.section {
            case 0:
                cellId = "default"
                style = UITableViewCellStyle.default
                text = "default_text"
            case 1:
                cellId = "subtitle"
                style = UITableViewCellStyle.subtitle
                text = "subtitle_text"
            case 2:
                cellId = "value1"
                style = UITableViewCellStyle.value1
                text = "value1_text"
            default:
                cellId = "value2"
                style = UITableViewCellStyle.value2
                text = "value2_text"
            }
            cell = tableView.dequeueReusableCell(withIdentifier: cellId)
            if cell == nil {
                cell = UITableViewCell (style: style, reuseIdentifier: cellId)
            }
            cell?.imageView?.image = image
            cell?.textLabel?.text = text
            cell?.detailTextLabel?.text = detailText
            cell?.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
            return cell!
        }

}
