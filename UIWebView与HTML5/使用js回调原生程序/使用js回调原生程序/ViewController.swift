//
//  ViewController.swift
//  使用js回调原生程序
//
//  Created by 于淼华 on 2017/7/13.
//  Copyright © 2017年 于淼华. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIWebViewDelegate {
    var webView : UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let bounds = UIScreen.main.bounds
        webView = UIWebView(frame: CGRect(x: 0, y: 40, width: bounds.size.width, height: bounds.size.height - 40))
        webView.backgroundColor = UIColor.clear
        webView.delegate = self
        self.view.addSubview(webView)
        
        let path = Bundle.main.path(forResource: "GetDeviceInfo", ofType: "html")
        let url = URL(fileURLWithPath: path!)
        webView.loadRequest(NSURLRequest(url: url)as URLRequest)
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        let url = request.url?.absoluteString
        let components = url?.components(separatedBy: ":")
        let firstElement = components?[0]
        if (components?.count )!>1 && firstElement! == "callios" {
            let model = UIDevice.current.model
            let  systemName = UIDevice.current.systemName
            let systemVersion = UIDevice.current.systemVersion
            let  message = "设备类型；" + model + "\\n系统类型：" + systemName + "\\n系统版本：" + systemVersion
            webView.stringByEvaluatingJavaScript(from: "alert('"+message+"')")
            
            
            return false
            
        }
        
        return true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

