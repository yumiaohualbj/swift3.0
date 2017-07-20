//
//  ViewController.swift
//  UIWebView
//
//  Created by 于淼华 on 2017/7/10.
//  Copyright © 2017年 于淼华. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIWebViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        let bounds = UIScreen.main.bounds
        let frame = CGRect(x: 0, y: 0, width: bounds.size.width, height: bounds.size.height)
        
        let  webView  = UIWebView(frame: frame)
        
        webView.delegate = self
        webView.backgroundColor = UIColor.clear
        let url  = URL(string: "http://www.baidu.com/")
        let urlRequest = NSURLRequest(url: url!)
        webView.loadRequest(urlRequest as URLRequest)
        self.view.addSubview(webView)
        
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

