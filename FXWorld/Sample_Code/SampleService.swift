//
//  SampleService.swift
//  CoordinatorSample
//
//  Created by Aldo Bergamini on 27/01/2020.
//  Copyright © 2020 iBat Inc. All rights reserved.
//

import Foundation



class SampleService: Service {
    
    
    var ready: Bool
    
    func prepareRequestMethods(with responseBlocks: [String: APIResponseBlock]? = nil) {
    }
    
    func requestMethodsSignature() -> [APIMethod] {
        return []
    }

    func registerResponse(block responseBlock: (ResultType) -> Void, for request: APIMethod) {
    }
    
    func sendRequest(for method: APIMethod, withData data: [String : Any]?) {
    }
    
    
    var client: ServiceClient
    
    init(withClient target: ServiceClient) {
        
        self.client = target
        self.ready = false
    }
    
}
