//
//  Font.swift
//  CodeTemplateSwift
//
//  Created by Hongming Zuo on 2018-05-06.
//  Copyright © 2018 Hongming Zuo. All rights reserved.
//

import Foundation
import UIKit

private let brandFontMapping: [UIFont.Weight: String] = [
  .light: "PingFangTC-Thin",
  .regular: "PingFangTC-Regular",
  .bold: "PingFangTC-Semibold"
]

extension UIFont {
  static func appFont(with size: CGFloat, weight: Weight = .regular) -> UIFont {
    guard let fontName = brandFontMapping[weight], let result = UIFont(name: fontName, size: size) else {
      fatalError("Font weight not found")
    }
    return result
  }
}
