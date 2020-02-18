//
//  AutoLayout.swift
//  CodeTemplateSwift
//
//  Created by Hongming Zuo on 2018-07-04.
//  Copyright © 2018 Hongming Zuo. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
  
  func pin(to view: UIView, padding: UIEdgeInsets = UIEdgeInsets.zero) {
    NSLayoutConstraint.activate([
        self.topAnchor.constraint(equalTo: view.topAnchor, constant: padding.top),
        self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: padding.bottom),
        self.leftAnchor.constraint(equalTo: view.leftAnchor, constant: padding.left),
        self.rightAnchor.constraint(equalTo: view.rightAnchor, constant: padding.right),
    ])
  }
  
  func pinToSuperView() {
    guard let superView = superview else {
      fatalError("You need super view")
    }
    pin(to: superView)
  }
  
  @discardableResult
  func layoutByConstraint() -> Self {
    translatesAutoresizingMaskIntoConstraints = false
    return self
  }
}
