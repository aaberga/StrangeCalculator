//
//  Coordinator.swift
//  
//
//  Created by Aldo Bergamini on 19/09/2018.
//  Copyright © 2018 - 2019 iBat Inc. All rights reserved.
//

import Foundation

public protocol TargetView {
    
}

public protocol Coordinator {
    
    var viewController: TargetView { set get }
    
    func start()
}

public protocol SubCoordinator: Coordinator {
    
    var parentViewController: TargetView { set get }
    var presenter: Coordinator? { set get }
    var details: [String: Any]? { get set }
}


