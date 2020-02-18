//
//  Geometry.swift
//  CodeTemplate
//
//  Created by Homer Zuo on 2020-02-13.
//  Copyright © 2020 zzz. All rights reserved.
//

import Foundation
import UIKit

extension UIEdgeInsets {
  
  init(uniformPadding value: CGFloat) {
    self.init(top: value, left: value, bottom: -value, right: -value)
  }
  
}
