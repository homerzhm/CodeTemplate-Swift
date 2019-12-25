//
//  DebugModel.swift
//  CodeTemplateSwift
//
//  Created by Hongming Zuo on 2018-07-04.
//  Copyright © 2018 Hongming Zuo. All rights reserved.
//

import Foundation
import UIKit

enum DebugOptionType {
  case function
  case viewController
}

class DebugOption {
  
  let title: String
  let type: DebugOptionType
  
  var actionBlock: ((_ viewController: UIViewController?) -> Void)?
  
  init(with title: String, type: DebugOptionType = .function) {
    self.title = title
    self.type = type
  }
}

protocol DebugItemProtocal {
  static func generateDebugOption() -> DebugOption
}
