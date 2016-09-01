//
//  TextViewController.swift
//  DifferentLayerDemo
//
//  Created by zhai on 16/9/1.
//  Copyright © 2016年 zhai. All rights reserved.
//

import UIKit

class TextViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = UIRectEdge.None
        
        let textLayer = CATextLayer()
        
        textLayer.frame = self.view.bounds
        
        self.view.layer.addSublayer(textLayer)
        textLayer.foregroundColor = UIColor.blueColor().CGColor
        textLayer.alignmentMode = kCAAlignmentJustified
        textLayer.wrapped = true
        
        let font = UIFont.systemFontOfSize(15)
        let fontRef = CGFontCreateWithFontName(font.fontName)
        textLayer.font = fontRef
        textLayer.fontSize = font.pointSize
        textLayer.contentsScale = UIScreen.mainScreen().scale
        
    
        let attributedString = NSMutableAttributedString(string: "示例文字 No.1 示例文字 No.2\n示例文字 No.3")
        let firstAttributes = [NSForegroundColorAttributeName: UIColor.blueColor(), NSBackgroundColorAttributeName: UIColor.yellowColor(), NSUnderlineStyleAttributeName: 1]
        let secondAttributes = [NSForegroundColorAttributeName: UIColor.redColor(), NSBackgroundColorAttributeName: UIColor.blueColor(), NSStrikethroughStyleAttributeName: 1]
        let thirdAttributes = [NSForegroundColorAttributeName: UIColor.greenColor(), NSBackgroundColorAttributeName: UIColor.blackColor(), NSFontAttributeName: UIFont.systemFontOfSize(40)]
        
        attributedString.addAttributes(firstAttributes, range: NSRange(location: 0,length: 10))
        attributedString.addAttributes(secondAttributes, range:NSRange(location: 0,length: 10))
        attributedString.addAttributes(thirdAttributes, range: NSRange(location: 0,length: 10))
        
        textLayer.string = attributedString
    }

}
