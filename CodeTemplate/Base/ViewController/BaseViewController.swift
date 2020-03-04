//
//  BaseViewController.swift
//  CodeTemplate
//
//  Created by Homer Zuo on 2020-02-12.
//  Copyright © 2020 zzz. All rights reserved.
//

import Foundation
import UIKit

open class BaseViewController: UIViewController {
  
  init() {
    super.init(nibName: nil, bundle: nil)
  }
  
  public var viewDidDismiss: ((_ viewController: BaseViewController) -> Void)?
  
  @available(*, unavailable)
  required public init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override public func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    viewDidDismiss?(self)
  }
  
}
