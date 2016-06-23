//
//  UIImage+Extension.swift
//  LearnDrawing
//
//  Created by Dinh Luu on 23/06/2016.
//  Copyright © 2016 Dinh Luu. All rights reserved.
//

import UIKit

extension UIImage {
  
  static func swatchWithColor(color: UIColor, size: CGFloat) -> UIImage {
    UIGraphicsBeginImageContextWithOptions(CGSize(width: size, height: size), true, 0.0)
    
    color.setFill()
    UIRectFill(CGRect(x: 0, y: 0, width: size, height: size))
    
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return image
  }
  
  func grayScaleVersion() -> UIImage? {
    let colorSpace = CGColorSpaceCreateDeviceGray()
    
    if colorSpace == nil {
      print("error creating color gray")
      return nil
    }
    
    let width = Int(self.size.width)
    let height = Int(self.size.height)
    
    let context = CGBitmapContextCreate(nil, width, height, 8, width, colorSpace, CGImageAlphaInfo.NoneSkipFirst.rawValue)
    if context == nil {
      print("error building gray context")
      return nil
    }
    
    let rect = sizeMakeRect(self.size)
    CGContextDrawImage(context, rect, self.CGImage)
    let image = CGBitmapContextCreateImage(context)
    let output = UIImage(CGImage: image!)
    return output
  }
}

func imageWithGrayRectInCenterWith(withImage sourceImage: UIImage, destRect: CGRect, percent: CGFloat) {
  let context = UIGraphicsGetCurrentContext()
  CGContextSaveGState(context)
  let insetRect = destRect.rectInsetBy(percent: percent)
  
  addClip(context!, rect: insetRect)
  
  sourceImage.grayScaleVersion()?.drawInRect(destRect)
  CGContextRestoreGState(context)
  
  UIRectFrame(insetRect)
}

func imageFromBytes(data: NSData, targetSize: CGSize) -> UIImage? {
  let width = Int(targetSize.width)
  let height = Int(targetSize.height)
  if data.length < (width * height * 4) {
    print("Error about length")
    return nil
  }
  
  let colorSpace = CGColorSpaceCreateDeviceRGB()
  if colorSpace == nil {
    print("error about color")
    return nil
  }
  
  let bytes = UnsafeMutablePointer<UInt8>(malloc(width * height * 4))
  let context = CGBitmapContextCreate(bytes, width, height, 8, width * 4, colorSpace, CGImageAlphaInfo.NoneSkipFirst.rawValue)
  if context == nil {
    print("error about context")
    return nil
  }
  
  let imageRef = CGBitmapContextCreateImage(context!)
  let image = UIImage(CGImage: imageRef!)
  
  return image
  
}

