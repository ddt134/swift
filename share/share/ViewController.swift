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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated);
        let itemToShare = [
            "item1",
            "item2",
            "item3",
        ];
        let activityController = UIActivityViewController(activityItems: itemToShare, applicationActivities: [StringReverseActivity()]);
        present(activityController, animated: true, completion: nil);
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
        let activityViewController = UIActivityViewController(activityItems: [textField.text! as String],applicationActivities: [StringReverseActivity()]);
        present(activityViewController, animated: true, completion: {});
    }

}

class StringReverseActivity: UIActivity{
    var items = [String]();
    override var activityType: UIActivityType?{
        return UIActivityType(rawValue: StringReverseActivity.self.description());
    }
    override var activityTitle: String?{
        return "reverse String";
    }
    override var activityImage: UIImage?{
        return UIImage(named: "reverse")!;
    }
    
//    override class var activityCategory: UIActivityCategory {
//        return .action
//    }
    override func canPerform(withActivityItems activityItems: [Any]) -> Bool {
        for item in activityItems{
            if(item is String){
                return true;
            }
        }
        return false;
    }
    
    override func prepare(withActivityItems activityItems: [Any]) {
        for item in activityItems{
            if(item is String){
                items.append(item as! String);
            }
        }
    }
    override func perform() {
        var reversedString = "";
        for string in items{
            reversedString += reverseOfString(string) + "\n";
        }
        print(reversedString);
    }
    func reverseOfString(_ string:String) -> String{
        var result = "";
        var characters = [Character]();
        for character in string {
            characters.append(character);
        }
        for character in characters.reversed(){
            result += "\(character)";
        }
        return result;
    }
}


