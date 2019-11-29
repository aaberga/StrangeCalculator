//
//  TargetViewTestCase.swift
//  Hello CoordinatorTests
//
//  Created by Aldo Bergamini on 29/11/2019.
//  Copyright © 2019 iBat Inc. All rights reserved.
//

import XCTest

@testable import Hello_Coordinator

class TargetViewTestCase: XCTestCase, TargetView {
    
    // Properties

    var testResponse: TestResponse?

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    // Methods
    
    func evaluateResponse(key testKey: TestKey, response: ResultActionType? = nil) {
        
        //    var responseActions: [ResultKey: ResultActionType] = [:]
        
        if let currentExpectation = self.testResponse?.expectation {
            
            if let currentResponse = response {
                
                
            }
            
            if let responseAction = self.testResponse?.responseActions[testKey] {
                
                
            }
            
        }

    }
}
