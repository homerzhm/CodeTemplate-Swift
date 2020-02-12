//
//  DebugsViewModel.swift
//  CodeTemplate
//
//  Created by Homer Zuo on 2020-02-12.
//  Copyright © 2020 zzz. All rights reserved.
//

import Foundation
import Combine

class DebugsViewModel: ViewModelProtocol {
  
  struct Input {
    
  }
  
  struct Output {
    let debugOptions: CurrentValueSubject<[DebugOption], Never>
  }
  
  let input: Input
  let output: Output
  
  private let debugOptions = CurrentValueSubject<[DebugOption], Never>([])
  
  init() {
    self.input = Input()
    self.output = Output(
      debugOptions: debugOptions
    )
  }
}
