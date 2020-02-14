//
//  Control.swift
//  CodeTemplate
//
//  Created by Homer Zuo on 2020-02-13.
//  Copyright © 2020 zzz. All rights reserved.
//

import Foundation
import UIKit

class BaseControl: UIControl {
  
  let contentView = UIView().layoutByConstaint()
  
  init() {
    super.init(frame: .zero)
    addSubview(contentView)
    contentView.pin(to: self)
    contentView.backgroundColor = .green
    addTarget(self, action: #selector(test), for: .touchUpInside)
  }
  
  @objc
  private func test() {
    //print("....")
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
    let hitView = super.hitTest(point, with: event)
    if let view = hitView {
      if view == contentView {
        return self
      }
    }
    return hitView
  }
  
  override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
    let result = super.beginTracking(touch, with: event)
    
    UIView.animate(withDuration: 0.3, delay: 0.0, usingSpringWithDamping: 0.3, initialSpringVelocity: 5, options: .curveEaseInOut, animations: {
      self.contentView.transform = CGAffineTransform.identity.scaledBy(x: 0.8, y: 0.8)
    }, completion: nil)
    
    return result
  }
  
  override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
    let result = super.continueTracking(touch, with: event)
    
    return result
  }
  
  override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
    super.endTracking(touch, with: event)
    UIView.animate(withDuration: 0.3, delay: 0.0, usingSpringWithDamping: 0.3, initialSpringVelocity: 5, options: .curveEaseInOut, animations: {
      self.contentView.transform = .identity
    }, completion: nil)
  }
  
  override var intrinsicContentSize: CGSize {
    return CGSize(width: 300, height: 100)
  }
  
}
