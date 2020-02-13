//
//  UIComponentListViewController.swift
//  CodeTemplate
//
//  Created by Homer Zuo on 2020-02-12.
//  Copyright © 2020 zzz. All rights reserved.
//

import Foundation

class UIComponentListViewController: BaseViewController, ViewControllerProtocol {
  
  var viewModel: UIComponentListViewModel
  
  let _view = StackScrollView()
  
  override func loadView() {
    view = _view
  }
  
  required init(viewModel: UIComponentListViewModel) {
    self.viewModel = viewModel
    super.init()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
