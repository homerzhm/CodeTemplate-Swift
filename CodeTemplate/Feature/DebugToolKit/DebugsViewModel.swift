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
    let optionSelectedSubject:  PassthroughSubject<DebugOption, Never>
  }
  
  struct Output {
    let debugOptions: CurrentValueSubject<[DebugOption], Never>
    let optionSelected: PassthroughSubject<DebugOption, Never>
  }
  
  let input: Input
  let output: Output
  
  private let debugOptions = CurrentValueSubject<[DebugOption], Never>([])
  private let optionSelected = PassthroughSubject<DebugOption, Never>()
  
  init() {
    self.input = Input(
      optionSelectedSubject: optionSelected
    )
    self.output = Output(
      debugOptions: debugOptions,
      optionSelected: optionSelected
    )
  }
  
  func reloadData() {
    let items = debugItems.compactMap { debugItem -> [DebugOption]? in
      return debugItem.generateDebugOptions()
    }
    debugOptions.send(Array(items.joined()))
  }
  
  private let debugItems: [DebugItemProtocal.Type] = [
    UIComponentCoordinator.self
  ]
}
