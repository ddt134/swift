//
//  ViewController.swift
//  tableView
//
//  Created by 致远 on 2017/10/22.
//  Copyright © 2017年 致远. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    var tableView: UITableView!;
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView(frame: view.bounds, style: .plain);
        if let theTableView = tableView{
            theTableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "identifier");
            theTableView.delegate = self;
            theTableView.dataSource = self;
            theTableView.autoresizingMask = [.flexibleWidth, .flexibleHeight];
            view.addSubview(theTableView);
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 3;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 3;
        case 1:
            return 5;
        case 2:
            return 8;
        default:
            return 0;
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "identifier", for: indexPath) as UITableViewCell;
        cell.textLabel?.text = "Section \(indexPath.section)," + "Cell \(indexPath.row)";
        return cell;
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle{
        return .delete;
    }
    
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated);
        tableView!.setEditing(editing, animated: animated);
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            //allRows.removeAtIndex(indexPath.row);
            tableView.deleteRows(at: [indexPath], with: .left);
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

