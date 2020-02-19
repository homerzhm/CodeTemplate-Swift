//
//  CardComponentListViewModel.swift
//  CodeTemplate
//
//  Created by Homer Zuo on 2020-02-18.
//  Copyright © 2020 zzz. All rights reserved.
//

import Foundation
import UIKit

class CardComponentListViewModel: UIComponentListViewModel {
  
  override func provideData() -> [UIComponentPresentModel] {
    return [
      UIComponentPresentModel(presentViewCreator: Card<CardBaseLayout>.self, size: CGSize(width: 350.0, height: 350.0))
    ]
  }
  
}
