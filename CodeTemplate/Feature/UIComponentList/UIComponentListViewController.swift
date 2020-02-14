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
  
  override func viewDidLoad() {
    super.viewDidLoad()
    _view.stackView.axis = .vertical
    _view.stackView.alignment = .center
    _view.stackView.spacing = 10.0
    
    _view.stackView.addArrangedSubview(BaseControl())
  }
  
}
