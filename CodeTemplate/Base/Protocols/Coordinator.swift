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

public protocol Coordinator: class {
  
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

public extension Coordinator {
  
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

public class BaseCoordinator: NSObject & Coordinator {
  
  public var childCoordinators: [Coordinator] = []
  
  weak public var parentCoordinators: Coordinator?
  
  public let identifier: String = UUID().uuidString
  
  public let rootNavigationController: BaseNavigationViewController?
  
  public init(rootNavigationController: BaseNavigationViewController? = nil) {
    self.rootNavigationController = rootNavigationController
    super.init()
  }
  
  public func start() {
    fatalError("SubClass should override this")
  }
  
}
