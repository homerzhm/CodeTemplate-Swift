//
//  ButtonComponentListViewModel.swift
//  CodeTemplate
//
//  Created by Homer Zuo on 2020-02-18.
//  Copyright © 2020 zzz. All rights reserved.
//

import Foundation
import UIKit

class ButtonComponentListViewModel: UIComponentListViewModel {
  
  override func provideData() -> [UIComponentPresentModel] {
    return [
      UIComponentPresentModel(presentViewCreator: Button.self, size: CGSize(width: 300.0, height: 50.0))
    ]
  }
  
}
