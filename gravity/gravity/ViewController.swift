//
//  ViewController.swift
//  gravity
//
//  Created by 致远 on 2017/10/22.
//  Copyright © 2017年 致远. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var squareViews = [UIDynamicItem]();
    var animator: UIDynamicAnimator!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated);
        var colors = [UIColor.red,UIColor.green];
        var currentCenterPoint = view.center;
        let eachViewSize = CGSize(width: 50, height: 50);
        for counter in 0..<2{
            let newView = UIView(frame: CGRect(x: 0, y: 0, width: eachViewSize.width, height: eachViewSize.height));
            newView.backgroundColor=colors[counter];
            newView.center = currentCenterPoint;
            currentCenterPoint.y += eachViewSize.height + 10;
            squareViews.append(newView);
            view.addSubview(newView);
        }
        animator = UIDynamicAnimator(referenceView: view);
        let gravity = UIGravityBehavior(items: squareViews);
        animator.addBehavior(gravity);
        
        let collision = UICollisionBehavior(items: squareViews)
        collision.translatesReferenceBoundsIntoBoundary = true;
        animator.addBehavior(collision);
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

