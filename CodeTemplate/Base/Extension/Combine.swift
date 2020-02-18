//
//  Combine.swift
//  CodeTemplate
//
//  Created by Homer Zuo on 2020-02-18.
//  Copyright © 2020 zzz. All rights reserved.
//

import Foundation
import Combine

extension AnyCancellable {
  
  func dispose(at array: inout [AnyCancellable]) {
    array.append(self)
  }
  
}
