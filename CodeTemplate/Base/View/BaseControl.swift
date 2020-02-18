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
  
  let contentView = UIView().layoutByConstraint()
  private let backgroundColorView = UIView().layoutByConstraint()
  
  private var actions: [Action] = []
  var animation: Animation = .scale(value: 0.95)
  
  init() {
    super.init(frame: .zero)
    addSubview(contentView)
    contentView.clipsToBounds = true
    contentView.pin(to: self)
    contentView.addSubview(backgroundColorView)
    backgroundColorView.pinToSuperView()
    backgroundColorView.alpha = 0.0
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func addAction(event: UIControl.Event, handler: @escaping Action.ActionBlock) {
    let action = Action(event: event, handler: handler)
    actions.append(action)
    addTarget(action, action: #selector(Action.performAction), for: event)
  }
  
  func removeAllActions() {
    for action in actions {
      removeTarget(action, action: #selector(Action.performAction), for: action.event)
    }
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
    presentAnimation(animation: animation)
    return result
  }
  
  override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
    let result = super.continueTracking(touch, with: event)
    if touch.phase == .moved {
      isTouchInside ? presentAnimation(animation: animation) : dismissAnimation(animation: animation)
    }
    return result
  }
  
  override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
    super.endTracking(touch, with: event)
    if let touch = touch, touch.phase == .ended {
      dismissAnimation(animation: animation)
    }
  }
  
  private func presentAnimation(animation: Animation) {
    switch animation {
    case .scale(let value):
      UIView.animate(withDuration: 0.3, delay: 0.0, usingSpringWithDamping: 0.3, initialSpringVelocity: 5, options: .curveEaseInOut, animations: {
        self.contentView.transform = CGAffineTransform.identity.scaledBy(x: value, y: value)
      }, completion: nil)
    case .hightlight(let backgroundColor):
      backgroundColorView.backgroundColor = backgroundColor
      UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseOut, animations: {
        self.backgroundColorView.alpha = 1.0
      }, completion: nil)
    case .none:
      break
    }
  }
  
  private func dismissAnimation(animation: Animation) {
    switch animation {
    case .scale:
      UIView.animate(withDuration: 0.3, delay: 0.0, usingSpringWithDamping: 0.3, initialSpringVelocity: 5, options: .curveEaseInOut, animations: {
        self.contentView.transform = .identity
      }, completion: nil)
    case .hightlight:
      UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseIn, animations: {
        self.backgroundColorView.alpha = 0.0
      }, completion: nil)
    case .none:
      break
    }
  }
}

extension BaseControl {
  class Action {
    
    typealias ActionBlock = (Action, UIControl.Event) -> Void
    
    let handler: ActionBlock
    let event: UIControl.Event
    
    init(event: UIControl.Event, handler: @escaping ActionBlock) {
      self.handler = handler
      self.event = event
    }
    
    @objc
    func performAction() {
      handler(self, event)
    }
    
  }
  
  enum Animation {
    case scale(value: CGFloat)
    case hightlight(backgroundColor: UIColor)
    case none
  }
}
