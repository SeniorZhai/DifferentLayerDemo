//
//  GradientViewController.swift
//  DifferentLayerDemo
//
//  Created by zhai on 16/9/2.
//  Copyright © 2016年 zhai. All rights reserved.
//

import UIKit

class GradientViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // CAGradientLayer用来生产颜色的渐变效果的Layer
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        self.view.layer.addSublayer(gradientLayer)
        
        // 从红到橙再到紫
        gradientLayer.colors = [UIColor.redColor().CGColor,UIColor.orangeColor().CGColor,UIColor.purpleColor().CGColor]
        gradientLayer.locations = [0,0.5,1]
        
        // 指定从左上角到右下角
        gradientLayer.startPoint = CGPointMake(0,0)
        gradientLayer.endPoint = CGPointMake(1, 1)
    }

}
