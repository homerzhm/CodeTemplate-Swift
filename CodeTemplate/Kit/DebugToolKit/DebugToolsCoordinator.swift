//
//  DebugToolsCoordinator.swift
//  CodeTemplate
//
//  Created by Homer Zuo on 2020-02-12.
//  Copyright © 2020 zzz. All rights reserved.
//

import Foundation

class DebugToolsCoordinator: BaseCoordinator {
  
  private let viewModel = DebugsViewModel()
  
  override func start() {
    let vc = DebugToolsViewController(viewModel: viewModel)
    rootNavigationController?.pushViewController(vc, animated: false)
  }
  
}
