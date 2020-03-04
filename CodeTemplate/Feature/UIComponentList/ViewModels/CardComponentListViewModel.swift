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


extension Card: UIComponentPresentViewProtocol {
  
  static func createPresentViews() -> [UIView] {
    let card1 = Card<CardBaseLayout>()
    card1.infoAndData = CardBaseLayout(title: "NBA all Star 2020",
                                       header: "All Star",
                                       infoDescription: "Team LBJ",
                                       image: #imageLiteral(resourceName: "card-image-1"))
    
    let card2 = Card<CardImageBottomLayout>()
    card2.infoAndData = CardImageBottomLayout(title: "NBA All Star 2020\nLBJ Team\nLBJ Wins 157-155",
                                              header: "All Star",
                                              image: #imageLiteral(resourceName: "card-image-1"))
    
    let card3 = Card<CardFullImageLayout>()
    card3.infoAndData = CardFullImageLayout(title: "NBA All Star 2020\nLBJ Team\nLBJ Wins 157-155",
                                            header: "All Star",
                                            image: #imageLiteral(resourceName: "card-image-1"))
    
    return [card1, card2, card3]
  }
  
}
