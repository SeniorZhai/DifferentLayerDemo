//
//  TransformViewController.swift
//  DifferentLayerDemo
//
//  Created by zhai on 16/9/1.
//  Copyright © 2016年 zhai. All rights reserved.
//

import UIKit

class TransformViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var pt = CATransform3DIdentity;
        pt.m34 = -1.0 / 500.0;
        self.view.layer.sublayerTransform = pt;
        
        var c1t = CATransform3DIdentity;
        c1t = CATransform3DTranslate(c1t, -100, 0, 0);
        let cube1 = cubeWithTransform(c1t)
        self.view.layer.addSublayer(cube1)
        
        var c2t = CATransform3DIdentity;
        c2t = CATransform3DTranslate(c2t, 100, 0, 0);
        c2t = CATransform3DRotate(c2t, CGFloat(-M_PI_4), 1, 0, 0);
        c2t = CATransform3DRotate(c2t, CGFloat(-M_PI_4), 0, 1, 0);
        let cube2 = cubeWithTransform(c2t)
        self.view.layer.addSublayer(cube2)

    }
    
    func faceWithTransform(transform:CATransform3D) -> CALayer{
        let face = CALayer()
        face.frame = CGRectMake(-50, -50, 100, 100)
        let randomRed:CGFloat = CGFloat(drand48())
        let randomGreen:CGFloat = CGFloat(drand48())
        let randomBlue:CGFloat = CGFloat(drand48())
        face.backgroundColor = UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0).CGColor
        face.transform = transform
        return face
    }

    func cubeWithTransform(transform:CATransform3D)->CALayer{
        let cube = CATransformLayer()
        var ct = CATransform3DMakeTranslation(0, 0, 50)
        cube.addSublayer(self.faceWithTransform(ct))
        
        ct = CATransform3DMakeTranslation(50, 0, 0)
        ct = CATransform3DRotate(ct, CGFloat(M_PI_2) , 0, 1, 0)
        cube.addSublayer(self.faceWithTransform(ct))
        
        ct = CATransform3DMakeTranslation(0, -50, 0)
        ct = CATransform3DRotate(ct, CGFloat(M_PI_2) , 1, 0, 0)
        cube.addSublayer(self.faceWithTransform(ct))
       
        ct = CATransform3DMakeTranslation(0, 50, 0);
        ct = CATransform3DRotate(ct, CGFloat(-M_PI_2), 1, 0, 0);
        cube.addSublayer(self.faceWithTransform(ct))
      
        ct = CATransform3DMakeTranslation(-50, 0, 0);
        ct = CATransform3DRotate(ct, CGFloat(-M_PI_2), 0, 1, 0);
        cube.addSublayer(self.faceWithTransform(ct))
        
        ct = CATransform3DMakeTranslation(0, 0, -50);
        ct = CATransform3DRotate(ct, CGFloat(M_PI), 0, 1, 0);
        cube.addSublayer(self.faceWithTransform(ct))
        
    
        let containerSize = self.view.bounds.size
        cube.position = CGPointMake(containerSize.width/2, containerSize.height/2)
        
        cube.transform = transform;
        return cube
    }
}
