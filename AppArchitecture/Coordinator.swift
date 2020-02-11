//
//  Coordinator.swift
//  
//
//  Created by Aldo Bergamini on 19/09/2018.
//  Copyright © 2018 - 2019 iBat Inc. All rights reserved.
//

import Foundation

public protocol ViewTarget {
    
    var coordinator: Coordinator? { set get }
}


public protocol Coordinator {
    
    var viewTarget: ViewTarget { set get }
    
    func start()
}


public protocol SubCoordinator: Coordinator {
    
    var parentView: ViewTarget { set get }
    var presenter: Coordinator? { set get }
    
    var details: [String: Any]? { get set }
}


public protocol MultiCoordinator: Coordinator {
    
    var coordinators: [Coordinator]? { get }

    var details: [String: Any]? { get set }
    
    func addCoordinator(target coordinator: Coordinator, forKey coordinatorKey: String)
    func removeCoordinator(forKey coordinatorKey: String)
}





