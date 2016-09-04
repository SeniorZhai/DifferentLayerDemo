//
//  ReplicatorViewController.swift
//  DifferentLayerDemo
//
//  Created by zhai on 16/9/2.
//  Copyright © 2016年 zhai. All rights reserved.
//

import UIKit

class ReplicatorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // CAReplicatorLayer可以高效地生成许多相似的图层
        let replicator = CAReplicatorLayer()
        replicator.frame = self.view.bounds
        self.view.layer.addSublayer(replicator)
        
        replicator.instanceCount = 10
        
        var transform = CATransform3DIdentity
        transform = CATransform3DTranslate(transform, 0, 10, 0);
        transform = CATransform3DRotate(transform, CGFloat(M_PI / 5.0), 0, 0, 1)
        transform = CATransform3DTranslate(transform, 0, -10, 0)
        replicator.instanceTransform = transform
        
        replicator.instanceBlueOffset = -0.05
        replicator.instanceGreenOffset = -0.05
        
        let layer = CALayer()
        layer.frame = CGRectMake(100, 100, 100, 100)
        layer.backgroundColor = UIColor.grayColor().CGColor
        replicator.addSublayer(layer)
    }
}
