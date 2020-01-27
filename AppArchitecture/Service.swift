//
//  Service.swift
//  CoordinatorSample
//
//  Created by Aldo Bergamini on 27/01/2020.
//  Copyright © 2020 iBat Inc. All rights reserved.
//

import Foundation

public typealias ResultType = (result: Any?, error: Error?)

public protocol Service {
    
    var client: ServiceClient { set get }
    
    
}

public protocol ServiceClient {
    
    func receive(response: ResultType)
}
