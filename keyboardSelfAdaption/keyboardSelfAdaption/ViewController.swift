//
//  ViewController.swift
//  keyboardSelfAdaption
//
//  Created by 致远 on 2017/10/15.
//  Copyright © 2017年 致远. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextViewDelegate {

    var textView: UITextView!;
    let defaultContentInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0);
    
    @objc func handleKeyboardDidShow(notification: Notification){
        let keyboardRectAsObject = notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue;
        var keyboardRect = CGRect.zero;
        keyboardRectAsObject.getValue(&keyboardRect);
        textView.contentInset = UIEdgeInsets(top: defaultContentInset.top, left: 0, bottom: keyboardRect.height, right: 0)
        

    }
    
    @objc func handleKeyboardWillHide(notification: Notification){
        textView.contentInset=defaultContentInset;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        textView = UITextView(frame: view.bounds);
        textView.delegate = self;
        if let theTextView = textView {
            theTextView.text = "Some text goes here...";
            theTextView.font = UIFont(name: "system", size: 16);
            //theTextView.backgroundColor=UIColor.blue;
            theTextView.contentInset = defaultContentInset;
            view.addSubview(theTextView);
            
            NotificationCenter.default.addObserver(self, selector:#selector(ViewController.handleKeyboardDidShow(notification:)), name: NSNotification.Name.UIKeyboardDidShow, object: nil);
            
            NotificationCenter.default.addObserver(self, selector:#selector(ViewController.handleKeyboardWillHide(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil);
            
            
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //收键盘
//    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
//        if text == "\n"
//        {
//            textView.resignFirstResponder();
//            return true;
//        }
//        return true;
//    }
    
    deinit {
        NotificationCenter.default.removeObserver(self);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

