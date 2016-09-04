//
//  EmitterViewController.swift
//  DifferentLayerDemo
//
//  Created by zhai on 16/9/4.
//  Copyright © 2016年 zhai. All rights reserved.
//

import UIKit

class EmitterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // CAEitterLayer是一个高性能的粒子引擎，被用来创建实时粒子动画
        // CAEitterLayer可以当做CAEmitterCell的容器
        let emitter = CAEmitterLayer()
        emitter.frame = self.view.bounds
        self.view.layer.addSublayer(emitter)
        
        emitter.renderMode = kCAEmitterLayerAdditive
        emitter.emitterPosition = CGPointMake(CGFloat(emitter.frame.size.width/2),CGFloat(emitter.frame.size.height/2))
        
        let cell = CAEmitterCell()
        cell.contents = UIImage.init(named: "avatar")?.CGImage
        cell.birthRate = 150
        cell.lifetime = 5.0
        cell.alphaSpeed = -0.15
        cell.velocity = 50
        // 混合颜色
        cell.color = UIColor(red: 0.8, green: 0.9, blue: 0.8, alpha: 1).CGColor
        // 角度变换范围，2PI表示360度皆可出现
        cell.emissionRange = CGFloat(M_PI * 2)
        
        emitter.emitterCells = [cell]
        
    }

}
