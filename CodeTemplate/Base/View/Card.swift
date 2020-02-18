//
//  Card.swift
//  CodeTemplate
//
//  Created by Homer Zuo on 2020-02-18.
//  Copyright © 2020 zzz. All rights reserved.
//

import Foundation
import UIKit

class Card: BaseControl {
  
  private let imageView: UIImageView = {
    let result = UIImageView().layoutByConstraint()
    result.clipsToBounds = true
    return result
  }()
  
  private let verticalStackView: UIStackView = {
    let result = UIStackView()
    result.alignment = .leading
    result.axis = .vertical
    result.spacing = 5.0
    return result.layoutByConstraint()
  }()
  
  private let titleLabel: UILabel = {
    let result = UILabel()
    result.font = UIFont.systemFont(ofSize: 20.0, weight: .bold)
    return result
  }()
  
  private let headerLabel: UILabel = {
    let result = UILabel()
    result.font = UIFont.systemFont(ofSize: 13.0, weight: .regular)
    return result
  }()
  
  private let descriptionLabel: UILabel = {
    let result = UILabel()
    result.font = UIFont.systemFont(ofSize: 11.0, weight: .light)
    return result
  }()
  
  private var currentLayoutType: LayoutType
  
  init(with layoutType: LayoutType) {
    self.currentLayoutType = layoutType
    super.init()
    
    switch currentLayoutType {
    case .base(let image, let info):
      baseLayout(image: image, info: info)
    }
  }
  
  func baseLayout(image: UIImage, info: DetailInfo) {
    
    let stackViewPadding = UIEdgeInsets(uniformPadding: 10.0)
    imageView.contentMode = .scaleAspectFill
    
    contentView.addSubview(imageView)
    contentView.addSubview(verticalStackView)
    
    titleLabel.textColor = .black
    headerLabel.textColor = .lightGray
    descriptionLabel.textColor = .lightGray
    
    NSLayoutConstraint.activate([
      imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
      imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
      imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
      
      verticalStackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: stackViewPadding.top),
      verticalStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: stackViewPadding.bottom),
      verticalStackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: stackViewPadding.left),
      verticalStackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: stackViewPadding.right)
    ])
    
    let stackSubViews = [headerLabel, titleLabel, descriptionLabel]
    stackSubViews.forEach { subView in
      verticalStackView.addArrangedSubview(subView)
    }
    
    imageView.image = image
    titleLabel.text = info.title
    headerLabel.text = info.header
    descriptionLabel.text = info.infoDescription
    
    contentView.clipsToBounds = true
    contentView.layer.cornerRadius = 10.0
    contentView.backgroundColor = .white
  }
  
}

extension Card {
  
  struct DetailInfo {
    let header: String?
    let title: String
    let infoDescription: String?
  }
  
  enum LayoutType {
    case base(image: UIImage, info: DetailInfo)
  }
  
}

extension Card: UIComponentPresentViewProtocol {
  
  static func createPresentViews() -> [UIView] {
    let card1 = Card(with: .base(image: #imageLiteral(resourceName: "card-image-1"),
                                 info: Card.DetailInfo(header: "All Star",
                                                       title: "NBA all Star 2020",
                                                       infoDescription: "Team LBJ")))
    
    return [card1]
  }
  
}
