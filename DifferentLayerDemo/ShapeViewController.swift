//
//  ShapeViewController.swift
//  DifferentLayerDemo
//
//  Created by zhai on 16/9/1.
//  Copyright © 2016年 zhai. All rights reserved.
//

import UIKit

class ShapeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = UIBezierPath()
        path.moveToPoint(CGPointMake(175, 100))
        path.addArcWithCenter(CGPointMake(150, 100), radius: 25, startAngle: 0, endAngle: CGFloat(M_PI)*2, clockwise: true)
        path.moveToPoint(CGPointMake(150, 125))
        path.addLineToPoint(CGPointMake(125, 225))
        path.moveToPoint(CGPointMake(150, 175))
        path.addLineToPoint(CGPointMake(175, 225))
        path.moveToPoint(CGPointMake(100, 150))
        path.addLineToPoint(CGPointMake(200, 150))
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.redColor().CGColor
        shapeLayer.fillColor = UIColor.clearColor().CGColor; // 填充颜色
        shapeLayer.lineWidth = 5;   // 线宽
        shapeLayer.lineJoin = kCALineJoinRound;     // 链接点圆角处理
        shapeLayer.lineCap = kCALineCapRound;   // 线的样式
        shapeLayer.path = path.CGPath;
        
        self.view.layer.addSublayer(shapeLayer)
       
        // 利用ShapeLayer 设置圆角
        let subView = UIView(frame: CGRectMake(200, 200, 200, 300))
        subView.backgroundColor = UIColor.blueColor()
        let radii = CGSizeMake(20, 20)
        let maskPath = UIBezierPath(roundedRect: subView.bounds, byRoundingCorners: [.TopRight ,.TopLeft],cornerRadii: radii)
        let maskLayer = CAShapeLayer()
        maskLayer.path = maskPath.CGPath
        subView.layer.mask = maskLayer
        self.view.addSubview(subView)
        
    }
    
}
