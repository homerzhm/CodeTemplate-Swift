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

struct CardBaseLayout: CardLayoutAndData {
  
  let detailInfo: CardDetailInfo
  let image: UIImage
  
  func configCard(card: Card<CardBaseLayout>) {
    card.imageView.image = image
    card.titleLabel.text = detailInfo.title
    card.headerLabel.text = detailInfo.header
    card.descriptionLabel.text = detailInfo.infoDescription
  }
  
  static func layoutCard(card: Card<CardBaseLayout>) {
    card.imageView.contentMode = .scaleAspectFill
    
    card.contentView.addSubview(card.imageView)
    card.contentView.addSubview(card.verticalStackView)
    
    card.titleLabel.textColor = .black
    card.headerLabel.textColor = .lightGray
    card.descriptionLabel.textColor = .lightGray
    
    NSLayoutConstraint.activate([
      card.imageView.topAnchor.constraint(equalTo: card.contentView.topAnchor),
      card.imageView.leftAnchor.constraint(equalTo: card.contentView.leftAnchor),
      card.imageView.rightAnchor.constraint(equalTo: card.contentView.rightAnchor),
      
      card.verticalStackView.topAnchor.constraint(equalTo: card.imageView.bottomAnchor, constant: CardDesign.stackViewPadding.top),
      card.verticalStackView.bottomAnchor.constraint(equalTo: card.contentView.bottomAnchor, constant: CardDesign.stackViewPadding.bottom),
      card.verticalStackView.leftAnchor.constraint(equalTo: card.contentView.leftAnchor, constant: CardDesign.stackViewPadding.left),
      card.verticalStackView.rightAnchor.constraint(equalTo: card.contentView.rightAnchor, constant: CardDesign.stackViewPadding.right)
    ])
    
    let stackSubViews = [card.headerLabel, card.titleLabel, card.descriptionLabel]
    stackSubViews.forEach { subView in
      card.verticalStackView.addArrangedSubview(subView)
    }
    
    card.contentView.clipsToBounds = true
    card.contentView.layer.cornerRadius = 10.0
    card.contentView.backgroundColor = .white
    
    card.shadowSetting = .normal(info: BaseControl.ShadowInfo(path: nil,
                                                              radius: 7.0,
                                                              offset: CGSize(width: 2.0, height: 3.0),
                                                              opacity: 0.6,
                                                              color: UIColor.lightGray))
  }
}

struct CardImageBottomLayout: CardLayoutAndData {
  
  let detailInfo: CardDetailInfo
  let image: UIImage
  
  static func layoutCard(card: Card<CardImageBottomLayout>) {

    card.imageView.contentMode = .scaleAspectFill
    
    card.contentView.addSubview(card.verticalStackView)
    card.contentView.addSubview(card.imageView)
    
    card.titleLabel.textColor = .black
    card.headerLabel.textColor = .lightGray
    
    NSLayoutConstraint.activate([
      card.imageView.bottomAnchor.constraint(equalTo: card.contentView.bottomAnchor),
      card.imageView.leftAnchor.constraint(equalTo: card.contentView.leftAnchor),
      card.imageView.rightAnchor.constraint(equalTo: card.contentView.rightAnchor),
      
      card.verticalStackView.bottomAnchor.constraint(equalTo: card.imageView.topAnchor, constant: CardDesign.stackViewPadding.bottom),
      card.verticalStackView.topAnchor.constraint(equalTo: card.contentView.topAnchor, constant: CardDesign.stackViewPadding.top),
      card.verticalStackView.leftAnchor.constraint(equalTo: card.contentView.leftAnchor, constant: CardDesign.stackViewPadding.left),
      card.verticalStackView.rightAnchor.constraint(equalTo: card.contentView.rightAnchor, constant: CardDesign.stackViewPadding.right)
    ])
    
    let stackSubViews = [card.headerLabel, card.titleLabel]
    stackSubViews.forEach { subView in
      card.verticalStackView.addArrangedSubview(subView)
    }
    
    card.contentView.clipsToBounds = true
    card.contentView.layer.cornerRadius = 10.0
    card.contentView.backgroundColor = .white
    
    card.shadowSetting = .normal(info: BaseControl.ShadowInfo(path: nil,
                                                              radius: 7.0,
                                                              offset: CGSize(width: 2.0, height: 3.0),
                                                              opacity: 0.6,
                                                              color: UIColor.lightGray))
  }
  
  func configCard(card: Card<CardImageBottomLayout>) {
    card.imageView.image = image
    card.titleLabel.text = detailInfo.title
    card.headerLabel.text = detailInfo.header
  }
}

struct CardFullImageLayout: CardLayoutAndData {
  
  let title: String
  let header: String
  let image: UIImage
  
  var titleFont = UIFont.systemFont(ofSize: 25.0, weight: .bold)
  var headerFont = UIFont.systemFont(ofSize: 15.0, weight: .light)

  static func layoutCard(card: Card<CardFullImageLayout>) {
    card.imageView.contentMode = .scaleAspectFill
    card.contentView.addSubview(card.imageView)
    card.imageView.pinToSuperView()
    
    card.contentView.addSubview(card.verticalStackView)
    
    NSLayoutConstraint.activate([
      card.verticalStackView.topAnchor.constraint(equalTo: card.contentView.topAnchor, constant: CardDesign.stackViewPadding.top),
      card.verticalStackView.leftAnchor.constraint(equalTo: card.contentView.leftAnchor, constant: CardDesign.stackViewPadding.left),
      card.verticalStackView.rightAnchor.constraint(equalTo: card.contentView.rightAnchor, constant: CardDesign.stackViewPadding.right)
    ])
    
    let stackSubViews = [card.headerLabel, card.titleLabel]
    stackSubViews.forEach { subView in
      card.verticalStackView.addArrangedSubview(subView)
    }
    
    card.contentView.clipsToBounds = true
    card.contentView.layer.cornerRadius = 10.0
    
    card.shadowSetting = .normal(info: BaseControl.ShadowInfo(path: nil,
                                                              radius: 7.0,
                                                              offset: CGSize(width: 2.0, height: 3.0),
                                                              opacity: 0.6,
                                                              color: UIColor.lightGray))
  }
  
  func configCard(card: Card<CardFullImageLayout>) {
    card.imageView.image = image
    card.titleLabel.text = title
    card.headerLabel.text = header
    
    card.titleLabel.font = titleFont
    card.headerLabel.font = headerFont
    
    card.titleLabel.textColor = .white
    card.headerLabel.textColor = .lightGray
  }
  
}

extension Card: UIComponentPresentViewProtocol {
  
  static func createPresentViews() -> [UIView] {
    let card1 = Card<CardBaseLayout>()
    card1.infoAndData = CardBaseLayout(detailInfo: CardDetailInfo(header: "All Star",
                                                                  title: "NBA all Star 2020",
                                                                  infoDescription: "Team LBJ"),
                                       image: #imageLiteral(resourceName: "card-image-1"))
    
    let card2 = Card<CardImageBottomLayout>()
    card2.infoAndData = CardImageBottomLayout(detailInfo: CardDetailInfo(header: "All Star",
                                                                         title: "NBA All Star 2020\nLBJ Team\nLBJ Wins 157-155",
                                                                         infoDescription: nil),
                                              image: #imageLiteral(resourceName: "card-image-1"))
    
    let card3 = Card<CardFullImageLayout>()
    card3.infoAndData = CardFullImageLayout(title: "NBA All Star 2020\nLBJ Team\nLBJ Wins 157-155",
                                            header: "All Star",
                                            image: #imageLiteral(resourceName: "card-image-1"))
    
    return [card1, card2, card3]
  }
  
}
