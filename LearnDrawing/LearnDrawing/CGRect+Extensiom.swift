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
