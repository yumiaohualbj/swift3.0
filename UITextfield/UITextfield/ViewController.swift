//
//  ViewController.swift
//  UITextfield
//
//  Created by mac on 2017/4/24.
//  Copyright © 2017年 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        let rect = CGRect(x: 10, y: 80, width: 300, height: 40)
        
        
        
        
        let textfield = UITextField(frame: rect)
        
        textfield.placeholder = "Bank card on"
        
        textfield.autocorrectionType = UITextAutocorrectionType.no
        textfield.returnKeyType = UIReturnKeyType.done
        textfield.clearButtonMode = UITextFieldViewMode.whileEditing
        textfield.keyboardType = UIKeyboardType.numberPad
        textfield.keyboardAppearance  = UIKeyboardAppearance.dark
        textfield.delegate = self
        textfield.borderStyle = UITextBorderStyle.line
        
        self.view.addSubview(textfield)
        
    }
    
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
       return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }
    
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

