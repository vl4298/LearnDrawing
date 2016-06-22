//
//  TransformContext.swift
//  LearnDrawing
//
//  Created by Dinh Luu on 22/06/2016.
//  Copyright © 2016 Dinh Luu. All rights reserved.
//

import UIKit

@IBDesignable
class TransformContext: UIView {
  
  override func drawRect(rect: CGRect) {
    
    let font = UIFont.boldSystemFontOfSize(14)
    let alphabet: NSString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    let context = UIGraphicsGetCurrentContext()
    
    let center = CGPoint(x: CGRectGetMidX(rect), y: CGRectGetMidY(rect))
    let r = center.x * 0.75
    
    CGContextTranslateCTM(context, center.x, center.y)
    
    for i in 0..<26 {
      let letter: NSString = alphabet.substringWithRange(NSRange(location: i, length: 1))
      let letterSize = letter.sizeWithAttributes([NSFontAttributeName : font])
      
      let theta: CGFloat = CGFloat(i) * CGFloat(2 * M_PI / 26)
      
      CGContextSaveGState(context)
      CGContextRotateCTM(context, theta)
      
      CGContextTranslateCTM(context, -letterSize.width/2, -r)
      letter.drawAtPoint(CGPoint(x: 0, y: 0), withAttributes: [NSFontAttributeName : font])
      CGContextRestoreGState(context)
    }
  }

}
