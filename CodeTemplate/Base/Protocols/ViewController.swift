//
//  ViewController.swift
//  CodeTemplate
//
//  Created by Homer Zuo on 2020-02-12.
//  Copyright © 2020 zzz. All rights reserved.
//

import Foundation

protocol ViewControllerProtocol: class {
    associatedtype ViewModel = ViewModelProtocol
    
    var viewModel: ViewModel { get }
    
    init(viewModel: ViewModel)
}
