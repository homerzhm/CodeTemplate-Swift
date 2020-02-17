//
//  UIComponentCoordinator.swift
//  CodeTemplate
//
//  Created by Homer Zuo on 2020-02-12.
//  Copyright © 2020 zzz. All rights reserved.
//

import Foundation

class UIComponentCoordinator: BaseCoordinator {
  
  let viewModel = UIComponentListViewModel()
  
  override func start() {
    let vc = UIComponentListViewController(viewModel: viewModel)
    rootNavigationController?.pushViewController(vc, animated: true)
  }
  
}

extension UIComponentCoordinator: DebugItemProtocal {
  static func generateDebugOption() -> DebugOption {
    let createCoordination: DebugCoordinatorCreate = { navigationController in
      return UIComponentCoordinator(rootNavigationController: navigationController)
    }
    
    let option = DebugOption(with: "UI Components", type: .coordinator(coordinatorCreate: createCoordination))
    return option
  }
}
