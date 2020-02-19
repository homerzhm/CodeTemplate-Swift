//
//  StackScrollView.swift
//  CodeTemplate
//
//  Created by Homer Zuo on 2020-02-13.
//  Copyright © 2020 zzz. All rights reserved.
//

import Foundation
import UIKit

class StackScrollView: UIView {
  
  private let scrollView = UIScrollView().layoutByConstraint()
  let stackView = UIStackView().layoutByConstraint()
  
  var stackViewInset = UIEdgeInsets(uniformPadding: 0.0) {
    didSet {
      updateStackViewConstraint(inset: stackViewInset)
    }
  }
  
  private lazy var stackViewTopConstraint: NSLayoutConstraint = {
    return stackView.topAnchor.constraint(equalTo: scrollView.topAnchor)
  }()
  
  private lazy var stackViewLeftConstraint: NSLayoutConstraint = {
    return stackView.leftAnchor.constraint(equalTo: leftAnchor)
  }()
  
  private lazy var stackViewRightConstraint: NSLayoutConstraint = {
    return stackView.rightAnchor.constraint(equalTo: rightAnchor)
  }()
  
  private lazy var stackViewBottomConstraint: NSLayoutConstraint = {
    return stackView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor)
  }()
  
  init() {
    super.init(frame: .zero)
    addSubview(scrollView)
    scrollView.pinToSuperView()
    
    scrollView.addSubview(stackView)
    NSLayoutConstraint.activate([
      stackViewTopConstraint,
      stackViewLeftConstraint,
      stackViewRightConstraint,
      stackViewBottomConstraint
    ])
    updateStackViewConstraint(inset: stackViewInset)
    
    backgroundColor = .white
  }
  
  private func updateStackViewConstraint(inset: UIEdgeInsets) {
    stackViewTopConstraint.constant = inset.top
    stackViewLeftConstraint.constant = inset.left
    stackViewRightConstraint.constant = inset.right
    stackViewBottomConstraint.constant = inset.bottom
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
