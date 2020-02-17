//
//  UIComponentListViewModel.swift
//  CodeTemplate
//
//  Created by Homer Zuo on 2020-02-12.
//  Copyright © 2020 zzz. All rights reserved.
//

import Foundation
import UIKit

class UIComponentListViewModel: ViewModelProtocol {
  
  struct Input {
    
  }
  
  struct Output {
    
  }
  
  let input: Input
  let output: Output
  
  init() {
    input = Input()
    output = Output()
  }
  
}

protocol UIComponentPresentViewProtocol {
  static func createPresentView() -> UIView
}

struct UIComponentPresentModel {
  
  let presentView: UIView
  
  init(presentViewCreator: UIComponentPresentViewProtocol.Type, size: CGSize) {
    presentView = presentViewCreator.createPresentView()
    presentView.layoutByConstaint()
    NSLayoutConstraint.activate([
      presentView.widthAnchor.constraint(equalToConstant: size.width),
      presentView.heightAnchor.constraint(equalToConstant: size.height)
    ])
  }
  
}
