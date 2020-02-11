//
//  PluggableTestCase.swift
//  FXWorldTests
//
//  Created by Aldo Bergamini on 28/01/2020.
//  Copyright © 2020 Frequency Communications. All rights reserved.
//
//

import XCTest

@testable import FXWorld


class PluggableTestCase: XCTestCase {
    
    // Properties
    
    var testResponse: TestResponse?
    
    
    override func setUp() {
        
        self.testResponse = TestResponse()
    }
    
    override func tearDown() {
        
        self.testResponse = nil
    }
    
    
    // MARK: PluggableTestCase Results Handling Methods
    
    func evaluateResponse(key testKey: TestKey, response: ResultType? = nil) {
        
        if let testResponse = self.testResponse {
            
            if let currentExpectation = testResponse.expectation {
                
                if let currentResponse = response, let responseAction = self.testResponse?.responseActions[testKey] {
                    
                    responseAction(currentResponse.result, currentResponse.error)
                    
                } else if let currentResponse = response {
                    
                    let expectedResult = testResponse.expectedResults[testKey]
                    let expectedError = testResponse.expectedErrors[testKey]
                    
                    if (currentResponse.error == nil) && (currentResponse.result == nil) {
                        
                        self.evaluateResponse(key: testKey)
                    }
                    
                    if let expectedError = expectedError,
                        let currentError = currentResponse.error {
                        
                        if expectedError.localizedDescription == currentError.localizedDescription {
                            
                            currentExpectation.fulfill()
                            
                        } else {
                            
                            XCTFail("Response error \(currentError) not matched by expectations")
                        }
                        
                    } else if let expectedResult = expectedResult,
                        let currentResult = currentResponse.result {
                        
                        if (expectedResult as AnyObject).description == (currentResult as AnyObject).description {
                            
                            currentExpectation.fulfill()
                            
                        } else {
                            
                            XCTFail("Response value \(currentResult) not matched by expectations for test key \(testKey)")
                        }
                        
                    }
                } else {
                    
                    currentExpectation.fulfill()
                }
                
            } else {
                
                XCTFail("Missing Expectation!!")
            }
            
        } else {
            
            XCTFail("Missing TestResponse!!")
        }
    }
}







