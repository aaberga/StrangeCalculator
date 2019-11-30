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
        
//        print("key: \(testKey)")
//        print("response: \(String(describing: response))")

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
