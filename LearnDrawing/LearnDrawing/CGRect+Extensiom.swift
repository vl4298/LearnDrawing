//
//  CGRect+Extensiom.swift
//  LearnDrawing
//
//  Created by Van Luu on 22/06/2016.
//  Copyright © 2016 Dinh Luu. All rights reserved.
//

import Foundation
import UIKit

extension CGRect {
  func dl_center() -> CGPoint {
    return CGPoint(x: CGRectGetMidX(self), y: CGRectGetMidY(self))
  }
}

func rectAroundCenter(center: CGPoint, size: CGSize) -> CGRect {
  let halfWidth = size.width / 2
  let halfHeight = size.height / 2
  
  return CGRect(x: center.x - halfWidth, y: center.y - halfHeight, width: size.width, height: size.height)
}

func sizeScaleByFactor(size: CGSize, factor: CGFloat) -> CGSize {
  return CGSize(width: size.width * factor, height: size.height * factor)
}

// ---------- DRAWING FITTING---------
func aspectScaleFit(sourceSize: CGSize, desRect: CGRect) -> CGFloat {
  let desSize = desRect.size
  let scaleW = desSize.width / sourceSize.width
  let scaleH = desSize.height / sourceSize.height
  return min(scaleW, scaleH)
}

func rectByFittingInRect(sourceRect: CGRect, destRect: CGRect) -> CGRect {
  let aspect = aspectScaleFit(sourceRect.size, desRect: destRect)
  let targetSize = sizeScaleByFactor(sourceRect.size, factor: aspect)
  return rectAroundCenter(destRect.dl_center(), size: targetSize)
}

// ---------- DRAWING FILLING--------
func aspectScaleFill(sourceSize: CGSize, destRect: CGRect) -> CGFloat {
  let destSize = destRect.size
  let scaleW = destSize.width / sourceSize.width
  let scaleH = destSize.height / sourceSize.height
  return max(scaleW, scaleH)
}

func rectByFillingRect(sourceRect: CGRect, destRect: CGRect) -> CGRect {
  let aspect = aspectScaleFill(sourceRect.size, destRect: destRect)
  let targetSize = sizeScaleByFactor(sourceRect.size, factor: aspect)
  return rectAroundCenter(destRect.dl_center(), size: targetSize)
}


