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
  
  private let label = UILabel().layoutByConstraint()
  
  var textFont = UIFont.systemFont(ofSize: 15.0, weight: .semibold)
  
  var buttonText: String = "" {
    didSet {
      label.text = buttonText
    }
  }
  
  override init() {
    super.init()
    label.textAlignment = .center
    label.textColor = .white
    
    contentView.addSubview(label)
    NSLayoutConstraint.activate([
      label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
      label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
    ])
    contentView.layer.cornerRadius = Design.cornerRadiuse
    contentView.backgroundColor = UIColor(red: 222.0/255.0, green: 101.0/255.0, blue: 77.0/255.0, alpha: 1.0)
  }
  
}

extension Button: UIComponentPresentViewProtocol {
  
  static func createPresentViews() -> [UIView] {
    let button1 = Button()
    button1.buttonText = "Scale Button"
    
    let button2 = Button()
    button2.buttonText = "Highlight Button"
    button2.animation = .hightlight(backgroundColor: UIColor(red: 223.0/255.0, green: 154/255.0, blue: 135/255.0, alpha: 1.0))
    
    return [button1, button2]
  }
  
}
