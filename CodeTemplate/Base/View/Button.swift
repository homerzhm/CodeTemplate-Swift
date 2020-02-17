//
//  Button.swift
//  CodeTemplate
//
//  Created by Hongming Zuo on 2020-02-17.
//  Copyright © 2020 zzz. All rights reserved.
//

import Foundation
import UIKit

class Button: BaseControl {
  
  struct Design {
    static let cornerRadiuse: CGFloat = 5.0
  }
  
  let label = UILabel().layoutByConstaint()
  
  override init() {
    super.init()
    label.textAlignment = .center
    label.textColor = .black
    contentView.addSubview(label)
    NSLayoutConstraint.activate([
      label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
      label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
    ])
    contentView.layer.cornerRadius = Design.cornerRadiuse
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
