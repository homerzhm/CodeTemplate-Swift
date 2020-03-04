//
//  BaseNavigationViewController.swift
//  CodeTemplate
//
//  Created by Homer Zuo on 2020-02-12.
//  Copyright © 2020 zzz. All rights reserved.
//

import Foundation
import UIKit

public class BaseNavigationViewController: UINavigationController {
  
 public var viewDidDismiss: ((_ navigationViewController: UINavigationController) -> Void)?
  
  override public func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    viewDidDismiss?(self)
  }
  
}
