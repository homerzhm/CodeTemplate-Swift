//
//  Card.swift
//  CodeTemplate
//
//  Created by Homer Zuo on 2020-02-18.
//  Copyright © 2020 zzz. All rights reserved.
//

import Foundation
import UIKit

class Card<LayoutAndData: CardLayoutAndData>: BaseControl {
  
  let imageView: UIImageView = {
    let result = UIImageView().layoutByConstraint()
    result.clipsToBounds = true
    return result
  }()
  
  let verticalStackView: UIStackView = {
    let result = UIStackView()
    result.alignment = .leading
    result.axis = .vertical
    result.spacing = 5.0
    return result.layoutByConstraint()
  }()
  
  let titleLabel: UILabel = {
    let result = UILabel()
    result.font = UIFont.systemFont(ofSize: 20.0, weight: .bold)
    result.numberOfLines = 0
    return result
  }()
  
  let headerLabel: UILabel = {
    let result = UILabel()
    result.font = UIFont.systemFont(ofSize: 13.0, weight: .regular)
    return result
  }()
  
  let descriptionLabel: UILabel = {
    let result = UILabel()
    result.font = UIFont.systemFont(ofSize: 11.0, weight: .light)
    return result
  }()
  
  var infoAndData: LayoutAndData? {
    didSet {
      if let data = infoAndData {
        data.configCard(card: self)
      }
    }
  }
  
  override init() {
    super.init()
    LayoutAndData.layoutCard(card: self)
  }
}

struct CardDesign {
  static let stackViewPadding = UIEdgeInsets(uniformPadding: 10.0)
}

protocol CardLayoutAndData {
  static func layoutCard(card: Card<Self>)
  func configCard(card: Card<Self>)
}

struct CardDetailInfo {
  let header: String?
  let title: String
  let infoDescription: String?
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
