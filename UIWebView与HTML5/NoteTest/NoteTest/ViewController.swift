
//
//  ViewController.swift
//  NoteTest
//
//  Created by 于淼华 on 2017/7/13.
//  Copyright © 2017年 于淼华. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var webView:UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let bounds = UIScreen.main.bounds
        webView = UIWebView(frame: CGRect(x: 0, y: 60, width: bounds.size.width, height: bounds.size.height - 60))
        webView.backgroundColor = UIColor.red
        
        webView.scrollView.showsVerticalScrollIndicator = true
        self.view.addSubview(webView)
        
        let path = Bundle.main.path(forResource: "NoteBook", ofType: "html")
        let url = URL(fileURLWithPath: path!)
        webView.loadRequest(NSURLRequest(url: url) as URLRequest)
        
        let insertImage = UIButton(frame: CGRect(x: 40, y: 400, width: 240, height: 44))
        insertImage.setTitle("插入图片", for: UIControlState.init(rawValue: 0))
        insertImage.backgroundColor = UIColor.brown
        insertImage.addTarget(self, action: #selector(ViewController.insertImage), for: .touchUpInside)
        
        
        let saveNote = UIButton(frame: CGRect(x: 40, y: 470, width: 240, height: 44))
        saveNote.setTitle("保存笔记", for: UIControlState.init(rawValue: 0))
        saveNote.backgroundColor = UIColor.brown
        saveNote.addTarget(self, action: #selector(ViewController.saveNote), for: .touchUpInside)
        
        self.view.addSubview(insertImage)
        self.view.addSubview(saveNote)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    func insertImage()  {
        webView.stringByEvaluatingJavaScript(from: "insertImage(‘coffee.png')")
        
    }
    
    func saveNote()  {
        let node = webView.stringByEvaluatingJavaScript(from: "getNode()")
        print(node )
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

