//
//  ViewModel.swift
//  CodeTemplate
//
//  Created by Homer Zuo on 2020-02-12.
//  Copyright © 2020 zzz. All rights reserved.
//

import Foundation
import Foundation

/// Base for all controller view models.
///
/// It contains Input and Output types, usually expressed as nested structs inside a class implementation.
///
/// Input type should contain observers (e.g. AnyObserver) that should be subscribed to UI elements that emit input events.
///
/// Output type should contain observables that emit events related to result of processing of inputs.
public protocol ViewModelProtocol: class {
  associatedtype Input
  associatedtype Output
  
  var input: Input { get }
  var output: Output { get }
}
