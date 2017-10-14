//
//  ViewController.swift
//  share
//
//  Created by 致远 on 2017/10/14.
//  Copyright © 2017年 致远. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    var textField:UITextField!;
    var buttonShare:UIButton!;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        createTextField();
        createButton();
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createTextField(){
        textField = UITextField(frame: CGRect(x: 20, y: 35, width: 280, height: 30));
        textField.borderStyle = .roundedRect;
        textField.placeholder = "enter text to share";
        textField.delegate = self;
        view.addSubview(textField);
        
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder();
        return true;
    }
    func createButton(){
        buttonShare = UIButton.init(type: .system);
        buttonShare.frame = CGRect(x: 20, y: 80, width: 280, height: 44);
        buttonShare.setTitle("share", for: .normal);
        
        buttonShare.addTarget(self, action: #selector(handleShare(sender:)), for: .touchUpInside);
        view.addSubview(buttonShare);
    }
    
    
    
    @objc func handleShare(sender: UIButton){
        if(textField.text!.isEmpty){
            let message = "please enter a text and then press 'share'";
            let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert);
            alertController.addAction(UIAlertAction(title: "ok", style: .default, handler: nil));
        
            present(alertController,animated: true, completion: nil);
            return;
        }
        let activityViewController = UIActivityViewController(activityItems: [textField.text! as NSString],applicationActivities: nil);
        present(activityViewController, animated: true, completion: {});
    }

}

