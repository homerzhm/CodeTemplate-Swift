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
  static func createPresentViews() -> [UIView]
}

struct UIComponentPresentModel {
  
  let presentViews: [UIView]
  
  init(presentViewCreator: UIComponentPresentViewProtocol.Type, size: CGSize) {
    presentViews = presentViewCreator.createPresentViews()
    presentViews.forEach { view in
      view.layoutByConstaint()
      NSLayoutConstraint.activate([
        view.widthAnchor.constraint(equalToConstant: size.width),
        view.heightAnchor.constraint(equalToConstant: size.height)
      ])
    }
  }
  
}
