//
//  UIComponentCoordinator.swift
//  CodeTemplate
//
//  Created by Homer Zuo on 2020-02-12.
//  Copyright © 2020 zzz. All rights reserved.
//

import Foundation

class UIComponentCoordinator: BaseCoordinator {
  
  var viewModel: UIComponentListViewModel = UIComponentListViewModel()
  
  override func start() {
    let vc = UIComponentListViewController(viewModel: viewModel)
    vc.viewDidDismiss = { [weak self] _ in
      self?.coordinatorIsFinished()
    }
    rootNavigationController?.pushViewController(vc, animated: true)
  }
  
}

extension UIComponentCoordinator: DebugItemProtocal {
  
  static func generateDebugOptions() -> [DebugOption] {
    
    // For Buttons
    let buttonsCoordintor: DebugCoordinatorCreate = { navigationController in
      let result = UIComponentCoordinator(rootNavigationController: navigationController)
      result.viewModel = ButtonComponentListViewModel()
      return result
    }
    let buttonsOption = DebugOption(with: "Buttons Components", type: .coordinator(coordinatorCreate: buttonsCoordintor))
    
    // For Cards
    let cardCoordination: DebugCoordinatorCreate = { navigationController in
      let result = UIComponentCoordinator(rootNavigationController: navigationController)
      result.viewModel = CardComponentListViewModel()
      return result
    }
    let cardOption = DebugOption(with: "Cards Components", type: .coordinator(coordinatorCreate: cardCoordination))
    
    return [buttonsOption, cardOption]
  }
}
