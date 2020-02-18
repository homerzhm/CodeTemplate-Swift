//
//  Coordinator.swift
//  CodeTemplate
//
//  Created by Homer Zuo on 2020-02-12.
//  Copyright © 2020 zzz. All rights reserved.
//

import Foundation

import Foundation
import UIKit

protocol Coordinator: class {
  
  /// Identifier for coordinator
  var identifier: String { get }
  
  /// A reference to its Parent Coordiantor, and it should be weak reference.
  var parentCoordinators: Coordinator? { get set }
  
  /// Child coordinators hosting
  var childCoordinators: [Coordinator] { get set }
  
  /// Root Navigation Controller for maintaining UI flow
  var rootNavigationController: BaseNavigationViewController? { get }
  
  /// Function for triggering coordinator UI flow start
  func start()
  
  /// Call whenever coordinator is finished and need to be release
  func coordinatorIsFinished()
}

extension Coordinator {
  
  func addChildCoordinator(childCoordinator: Coordinator) {
    if childCoordinators.first(where: { $0.identifier == childCoordinator.identifier }) != nil {
      return
    }
    childCoordinator.parentCoordinators = self
    childCoordinators.append(childCoordinator)
  }
  
  func removeChildCoordinator(childCoordinator: Coordinator) {
    childCoordinators = childCoordinators.filter({ $0.identifier != childCoordinator.identifier })
  }

  func coordinatorIsFinished() {
    if let parent = parentCoordinators {
      parent.removeChildCoordinator(childCoordinator: self)
    }
  }
  
}

class BaseCoordinator: NSObject & Coordinator {
  
  var childCoordinators: [Coordinator] = []
  
  weak var parentCoordinators: Coordinator?
  
  let identifier: String = UUID().uuidString
  
  let rootNavigationController: BaseNavigationViewController?
  
  init(rootNavigationController: BaseNavigationViewController? = nil) {
    self.rootNavigationController = rootNavigationController
    super.init()
  }
  
  func start() {
    fatalError("SubClass should override this")
  }
  
}
