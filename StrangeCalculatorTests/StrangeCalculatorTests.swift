//
//  StrangeCalculatorTests.swift
//  StrangeCalculatorTests
//
//  Created by Aldo Bergamini on 26/11/2019.
//  Copyright © 2019 Aldo Bergamini. All rights reserved.
//

import XCTest

@testable import StrangeCalculator


class StrangeCalculatorTests: TargetViewTestCase, MainDisplayView {
    
    // Properties

    var coordinator: MainCoordinator?
 
    
    // Setup
    
    override func setUp() {
        
        super.setUp()
        self.coordinator = MainCoordinator(mainController: self)
    }

    override func tearDown() {

    }

    
    // MainDisplayView Protocol
    
    func clearDisplay() {
        
        if let testResponse = self.testResponse {
            
            self.evaluateResponse(key: testResponse.testKey, response: (result: nil, error: nil))
        }

//        if let currentExpectation = self.testResponse?.expectation {
//            currentExpectation.fulfill()
//        }
    }
    
    func displayPowerfulResult(_ result: Bool, error: Error?) {
        
        if let testResponse = self.testResponse {
            
            self.evaluateResponse(key: testResponse.testKey, response: (result: result, error: error))
        }

        /*
        if let currentExpectation = self.testResponse?.expectation {
            
            if let expectedError = self.testResponse?.errors["testPowerful"] {
                
                if let error = error {
                    
                    if error.localizedDescription == expectedError.localizedDescription {
                        
                        currentExpectation.fulfill()
                    }
                }
            }
            
            if let expectedResult = self.testResponse?.results["testPowerful"] as? Bool {
                
                if result == expectedResult {
                    
                    currentExpectation.fulfill()
                }
            }
        }
        */
    }
    
    func displayComplementResult(_ result: NSInteger, error: Error?) {
        
        if let testResponse = self.testResponse {
            
            self.evaluateResponse(key: testResponse.testKey, response: (result: result, error: error))
        }
    }
    
    func displayFactorialResult(_ result: Double, error: Error?) {
        
        if let testResponse = self.testResponse {
            
            self.evaluateResponse(key: testResponse.testKey, response: (result: result, error: error))
        }
    }
    
    
    // Tests
    
    func testClear() {
        
        let expectationGuard = self.expectation(description: "testClear")

        if let coordinator = self.coordinator  {
            
            self.testResponse?.expectation = expectationGuard
            coordinator.resetDisplay()        
        }
        
        // *********************************
        
        waitForExpectations(timeout: 1) { error in
        }
    }

    func testPowerful() {
        
        let expectationGuard = self.expectation(description: "testPowerful")
        
        self.testResponse?.results["testPowerful"] = true
        self.testResponse?.errors["testPowerful"] = nil
        
        if let coordinator = self.coordinator  {
            
            self.testResponse?.expectation = expectationGuard
            coordinator.isNumberPowerful("1")
        }
        
        // *********************************
        
        waitForExpectations(timeout: 1) { error in
        }
    }
 
    
    func testComplement() {
        
        let expectationGuard = self.expectation(description: "testComplement")

        if let coordinator = self.coordinator  {
            
            self.testResponse?.expectation = expectationGuard
            coordinator.calculateComplement("1")
        }
        
        // *********************************
        
        waitForExpectations(timeout: 1) { error in
        }

    }

    
    func testFactorial_1() {
        
        let testKey = "testFactorial_1"
        let expectationGuard = self.expectation(description: testKey)
        
        self.testResponse?.testKey = testKey
        self.testResponse?.results["testFactorial_1"] = 1.0
        self.testResponse?.errors["testFactorial_1"] = nil
        
        if let coordinator = self.coordinator  {
            
            self.testResponse?.expectation = expectationGuard
            coordinator.calculateFactorial("1")
        }
        
        // *********************************
        
        waitForExpectations(timeout: 1) { error in
        }
    }

    
//
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
