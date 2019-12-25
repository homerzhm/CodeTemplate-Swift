//
//  Array.swift
//  CodeTemplateSwift
//
//  Created by Hongming Zuo on 2018-07-04.
//  Copyright © 2018 Hongming Zuo. All rights reserved.
//

import Foundation

extension Array {
  
  func at(index: Int) -> Element? {
    if count < index + 1  {
      return nil
    }
    return self[index]
  }
  
}
