//
//  ViewController.swift
//  UIWebView加载本地网页
//
//  Created by 于淼华 on 2017/7/13.
//  Copyright © 2017年 于淼华. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var webView:UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let bounds = UIScreen.main.bounds
        webView = UIWebView(frame: CGRect(x: 0, y: 40, width: bounds.size.width, height: bounds.size.height - 40))
        webView.backgroundColor = UIColor.red
        self.view.addSubview(webView)
        
        let path = Bundle.main.path(forResource: "Register", ofType: "html")
        let url = URL(fileURLWithPath: path!)
        webView.loadRequest(NSURLRequest(url: url) as URLRequest)
        
        let getInfo = UIButton(frame: CGRect(x: 40, y: 400, width: 240, height: 44))
        getInfo.setTitle("获取页面信息", for: UIControlState.init(rawValue: 0))
        getInfo.backgroundColor = UIColor.brown
        getInfo.addTarget(self, action: #selector(ViewController.getInfo), for: .touchUpInside)
        
        
        let submitform = UIButton(frame: CGRect(x: 40, y: 470, width: 240, height: 44))
        submitform.setTitle("设置并提交表单", for: UIControlState.init(rawValue: 0))
        submitform.backgroundColor = UIColor.brown
        submitform.addTarget(self, action: #selector(ViewController.submitForm), for: .touchUpInside)
        
        self.view.addSubview(getInfo)
        self.view.addSubview(submitform)
        
        
        
    }
    
    func getInfo() {
        let url = webView.stringByEvaluatingJavaScript(from: "document.location.href")
        let title = webView.stringByEvaluatingJavaScript(from: "document.title")
        let info = url! + "\n" + title!
        print(info)
    }
    
    func submitForm(){
        let firstJs = "document.getElementById('userName').value = 'jerry'"
        let secondeJs = "submitForm()"
        webView.stringByEvaluatingJavaScript(from: firstJs)
        webView.stringByEvaluatingJavaScript(from: secondeJs)
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

