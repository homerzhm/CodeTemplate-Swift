//
//  UIComponentListViewModel.swift
//  CodeTemplate
//
//  Created by Homer Zuo on 2020-02-12.
//  Copyright © 2020 zzz. All rights reserved.
//

import Foundation
import UIKit
import Combine

class UIComponentListViewModel: ViewModelProtocol {
  
  struct Input {
    
  }
  
  struct Output {
    let presentors: CurrentValueSubject<[UIComponentPresentModel], Never>
  }
  
  let input: Input
  let output: Output
  
  private let presentors = CurrentValueSubject<[UIComponentPresentModel], Never>([])
  
  init() {
    input = Input()
    output = Output(
      presentors: presentors
    )
  }
  
  func reloadData() {
    presentors.send(provideData())
  }
  
  func provideData() -> [UIComponentPresentModel] {
    fatalError("Need Sub class to override this method")
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
      view.layoutByConstraint()
      NSLayoutConstraint.activate([
        view.widthAnchor.constraint(equalToConstant: size.width),
        view.heightAnchor.constraint(equalToConstant: size.height)
      ])
    }
  }
}
