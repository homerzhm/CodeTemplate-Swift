//
//  Card+ImageBottomLayout.swift
//  CodeTemplate
//
//  Created by Homer Zuo on 2020-02-20.
//  Copyright © 2020 zzz. All rights reserved.
//

import Foundation
import UIKit

struct CardImageBottomLayout: CardLayoutAndData {
  
  let title: String
  let header: String?
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
    card.titleLabel.text = title
    card.headerLabel.text = header
  }
}
