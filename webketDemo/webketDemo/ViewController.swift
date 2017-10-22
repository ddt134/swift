//
//  ViewController.swift
//  webketDemo
//
//  Created by 致远 on 2017/10/18.
//  Copyright © 2017年 致远. All rights reserved.
//

import UIKit
import WebKit
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let path = Bundle.main.path(forResource: "index", ofType: ".html",
                                    inDirectory: "HTML5")
        let url = URL(fileURLWithPath:path!)
        let request = URLRequest(url:url)
        
        //将浏览器视图全屏(在内容区域全屏,不占用顶端时间条)
        let frame = CGRect(x:0, y:20, width:UIScreen.main.bounds.width,
                           height:UIScreen.main.bounds.height)
        let theWebView:WKWebView = WKWebView(frame:frame)
        //禁用页面在最顶端时下拉拖动效果
        theWebView.scrollView.bounces = false
        //加载页面
        theWebView.load(request)
        self.view.addSubview(theWebView)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

