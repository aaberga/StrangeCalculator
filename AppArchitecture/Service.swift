//
//  Service.swift
//  CoordinatorSample
//
//  Created by Aldo Bergamini on 27/01/2020.
//  Copyright © 2020 iBat Inc. All rights reserved.
//

import Foundation

public typealias ResultType = (status: Int?, result: Any?, error: Error?)
public typealias APIMethod = String
public typealias APIResponseBlock = (ResultType) -> Void

public protocol Service {
    
    // MARK: Properties
    
    var client: ServiceClient { set get }
    var ready: Bool { get }
    
    // MARK: Service Commands
    
    func prepareRequestMethods(with responseBlocks: [String: APIResponseBlock]?)
    func requestMethodsSignature() -> [APIMethod]

    func registerResponse(block responseBlock: @escaping (ResultType) -> Void, for request: APIMethod)
    func sendRequest(for method: APIMethod, withData data: [String: Any]?)
}

public protocol ServiceClient {
    
    func receive(status: Int?, result: Any?, error: Error?)
}
