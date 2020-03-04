//
//  Button.swift
//  CodeTemplate
//
//  Created by Hongming Zuo on 2020-02-17.
//  Copyright © 2020 zzz. All rights reserved.
//

import Foundation
import UIKit

public class Button: BaseControl {
  
  struct Design {
    static let cornerRadiuse: CGFloat = 5.0
  }
  
  private let label = UILabel().layoutByConstraint()
  
  public var textFont = UIFont.systemFont(ofSize: 15.0, weight: .semibold)
  
  public var buttonText: String = "" {
    didSet {
      label.text = buttonText
    }
  }
  
  override public init() {
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
  
  override public var intrinsicContentSize: CGSize {
    return CGSize(width: 100.0, height: 50.0)
  }
  
}
