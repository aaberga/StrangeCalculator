//
//  TargetViewTestCase.swift
//  Hello CoordinatorTests
//
//  Created by Aldo Bergamini on 29/11/2019.
//  Copyright © 2019 iBat Inc. All rights reserved.
//

import XCTest

@testable import StrangeCalculator

 
class TargetViewTestCase: XCTestCase, TargetView {
    
    // Properties

    var testResponse: TestResponse?

    override func setUp() {
        
        self.testResponse = TestResponse()
    }

    /*
    override func tearDown() {
    }
    */
    
    // Methods
    
    func evaluateResponse(key testKey: TestKey, response: ResultType? = nil) {
        
        // var responseActions: [ResultKey: ResultActionType] = [:]
        
        
        
        /*
        if let currentExpectation = self.testResponse?.expectation {
            
            if let currentResponse = response {
                
                
            }
            
            if let responseAction = self.testResponse?.responseActions[testKey] {
                
                
            }
            
        }
        
        if let response = response {
            
            if let currentExpectation = self.testResponse?.expectation {
                
                if let expectedError = self.testResponse?.errors["testFactorial_1"] {
                    
                    if let error = response.error {
                        
                        if error.localizedDescription == expectedError.localizedDescription {
                            
                            currentExpectation.fulfill()
                        }
                    }
                }
                
                if let expectedResult = self.testResponse?.results["testFactorial_1"] as? Double {
                    
                    if result == expectedResult {
                        
                        currentExpectation.fulfill()
                    }
                }
            }
        }
         */
    }
}
