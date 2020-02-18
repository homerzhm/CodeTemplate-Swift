//
//  UIComponentListViewController.swift
//  CodeTemplate
//
//  Created by Homer Zuo on 2020-02-12.
//  Copyright © 2020 zzz. All rights reserved.
//

import Foundation
import UIKit

class UIComponentListViewController: BaseViewController, ViewControllerProtocol {
  
  var viewModel: UIComponentListViewModel
  
  let _view = StackScrollView()
  
  private var presentors: [UIComponentPresentModel] = [
    UIComponentPresentModel(presentViewCreator: Button.self, size: CGSize(width: 300.0, height: 50.0))
  ]
  
  override func loadView() {
    view = _view
  }
  
  required init(viewModel: UIComponentListViewModel) {
    self.viewModel = viewModel
    super.init()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    _view.stackView.axis = .vertical
    _view.stackView.alignment = .center
    _view.stackView.spacing = 10.0
    _view.stackViewInset = UIEdgeInsets(uniformPadding: 10.0)
    
    for item in presentors {
      item.presentViews.forEach { theView in
        _view.stackView.addArrangedSubview(theView)
      }
    }
  }
  
}
