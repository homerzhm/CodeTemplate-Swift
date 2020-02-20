//
//  Card+FullImageLayout.swift
//  CodeTemplate
//
//  Created by Homer Zuo on 2020-02-20.
//  Copyright © 2020 zzz. All rights reserved.
//

import Foundation
import UIKit

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
