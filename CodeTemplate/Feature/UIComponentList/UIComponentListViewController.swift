//
//  UIComponentListViewController.swift
//  CodeTemplate
//
//  Created by Homer Zuo on 2020-02-12.
//  Copyright © 2020 zzz. All rights reserved.
//

import Foundation
import UIKit
import Combine

class UIComponentListViewController: BaseViewController, ViewControllerProtocol {
  
  let viewModel: UIComponentListViewModel
  
  let _view = StackScrollView()
  
  private var cancellables: [AnyCancellable] = []
  
  private var presentors: [UIComponentPresentModel] = [] {
    didSet {
      reloadPresentors()
    }
  }
  
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
    
    viewModel.output.presentors.sink { [weak self] data in
      self?.presentors = data
    }.dispose(at: &cancellables)
    
    viewModel.reloadData()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
  }
  
  private func reloadPresentors() {
    for view in _view.stackView.arrangedSubviews {
      view.removeFromSuperview()
    }
    for item in presentors {
      item.presentViews.forEach { theView in
        _view.stackView.addArrangedSubview(theView)
      }
    }
  }
  
}
