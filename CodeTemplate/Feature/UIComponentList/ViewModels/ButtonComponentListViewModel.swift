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
