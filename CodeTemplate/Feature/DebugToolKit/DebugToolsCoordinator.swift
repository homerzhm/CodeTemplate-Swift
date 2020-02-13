//
//  DebugToolsCoordinator.swift
//  CodeTemplate
//
//  Created by Homer Zuo on 2020-02-12.
//  Copyright © 2020 zzz. All rights reserved.
//

import Foundation
import Combine

class DebugToolsCoordinator: BaseCoordinator {
  
  private let viewModel = DebugsViewModel()
  
  private var cancellables: [Cancellable] = []
  
  override func start() {
    
    let optionSeleced = viewModel.output.optionSelected.sink { [weak self] option in
      self?.actionForOption(option: option)
    }
    cancellables.append(optionSeleced)
    
    let vc = DebugToolsViewController(viewModel: viewModel)
    rootNavigationController?.pushViewController(vc, animated: false)
  }
  
  private func actionForOption(option: DebugOption) {
    switch option.type {
    case .coordinator(let creator):
      let coordinator = creator(rootNavigationController)
      coordinator.start()
    case .function:
      break
    }
  }
  
}
