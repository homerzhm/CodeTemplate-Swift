//
//  DebugToolsViewController.swift
//  CodeTemplateSwift
//
//  Created by Hongming Zuo on 2018-07-04.
//  Copyright © 2018 Hongming Zuo. All rights reserved.
//

import Foundation
import UIKit
import Combine

class DebugToolsViewController: BaseViewController, ViewControllerProtocol {
  
  final class Design {
    static let cellIdentifier: String = "cellIdentifier"
  }
  
  var viewModel: DebugsViewModel
  private var cancellables: [AnyCancellable] = []
  
  required init(viewModel: DebugsViewModel) {
    self.viewModel = viewModel
    super.init()
  }
  
  let tableView = UITableView(frame: CGRect.zero, style: .grouped).layoutByConstraint()
    
  var debugOptions: [DebugOption] = [] {
    didSet {
      tableView.reloadData()
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(tableView)
    tableView.pinToSuperView()
    tableView.dataSource = self
    navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(closeDebugToolKit))
    tableView.delegate = self
    
    viewModel.output.debugOptions.sink { [weak self] options in
      self?.debugOptions = options
    }.dispose(at: &cancellables)
    
    viewModel.reloadData()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
  }
  
  @objc func closeDebugToolKit() {
    dismiss(animated: true, completion: nil)
  }
}

extension DebugToolsViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return debugOptions.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell(style: .default, reuseIdentifier: Design.cellIdentifier)
    cell.textLabel?.text = debugOptions.at(index: indexPath.row)?.title
    return cell
  }
  
}

extension DebugToolsViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    guard let debugOption = debugOptions.at(index: indexPath.row) else {
      return
    }
    viewModel.input.optionSelectedSubject.send(debugOption)
  }
  
}
