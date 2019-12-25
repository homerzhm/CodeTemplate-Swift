//
//  DebugToolsViewController.swift
//  CodeTemplateSwift
//
//  Created by Hongming Zuo on 2018-07-04.
//  Copyright © 2018 Hongming Zuo. All rights reserved.
//

import Foundation
import UIKit


protocol DebugToolsViewControllerDatasource: class {
  func getDebugOptions() -> [DebugOption]
}

class DebugToolsViewController: UIViewController {
  
  final class Design {
    static let cellIdentifier: String = "cellIdentifier"
  }
  
  let tableView = UITableView(frame: CGRect.zero, style: .grouped).layoutByConstaint()
  
  weak var datasource: DebugToolsViewControllerDatasource?
  
  var debugOptions: [DebugOption] = []
  
  init(datasource: DebugToolsViewControllerDatasource) {
    self.datasource = datasource
    super.init(nibName: nil, bundle: nil)
  }
  
  @available(*, unavailable)
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(tableView)
    tableView.pinToSuperView()
    tableView.dataSource = self
    navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(closeDebugToolKit))
    tableView.delegate = self
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    reloadData()
  }
  
  
  func reloadData() {
    guard let datasource = datasource else {
      return
    }
    debugOptions = datasource.getDebugOptions()
    tableView.reloadData()
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
    switch debugOption.type {
    case .viewController:
      debugOption.actionBlock?(self)
    default:
      break
    }
  }
  
}

extension DebugToolsViewController {
  
  class func showInViewController(viewController: UIViewController) {
    let nav = UINavigationController(rootViewController: DebugToolsViewController(datasource: DebugDatasource.shared))
    viewController.present(nav, animated: true, completion: nil)
  }
  
}
