//
//  ViewController.swift
//  UIWebviewLoadHtmlSTringAndGif
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
        let frame = CGRect(x: 0, y: 40, width: bounds.size.width, height: bounds.size.height - 40)
        webView = UIWebView(frame: frame)
        webView.delegate = self
        webView.backgroundColor = UIColor.clear
        self.view.addSubview(webView)
        
        let loadHTML = UIButton(frame: CGRect(x: 40, y: 400, width: 240, height: 44))
        loadHTML.setTitle("加载hmlt网页", for: UIControlState.init(rawValue: 0))
        loadHTML.backgroundColor = UIColor.brown
        loadHTML.addTarget(self, action: #selector(ViewController.loadHTML), for: .touchUpInside)
        
        self.view.addSubview(loadHTML)
        
        let loadGIF = UIButton(frame: CGRect(x: 40, y: 470, width: 240, height: 44))
        loadGIF.setTitle("加载GIF动画", for: UIControlState.init(rawValue: 0))
        loadGIF.backgroundColor = UIColor.brown
        loadGIF.addTarget(self, action: #selector(ViewController.loadGIF), for: .touchUpInside)
        
        self.view.addSubview(loadGIF)

        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func loadHTML()  {
        let  team  = "<div style='color:#ff0000;font-size:20px;'>团队名字：酷课堂</div>"
        let tel = "<div>电话：15110278751</div>"
        let url = "<div><b>网址：http://www.coolketang.com</b></div>"
        let  html = team + tel + url
        //设置webview可以将那些元素设置为可交互的对象，支持电话号码，日历，网址，地址，等可交互对象
        webView.dataDetectorTypes = [UIDataDetectorTypes.link,UIDataDetectorTypes.phoneNumber]
        webView.loadHTMLString(html, baseURL: nil)
        
        
    }
    
    
    func loadGIF()  {
        
        let resourceURL = Bundle.main.resourceURL
        webView.loadHTMLString("<img src='WildWorld.gif'>", baseURL: resourceURL)
        
        
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
