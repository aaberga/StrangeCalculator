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
    
    //    override func tearDown() {}
    
    
    // MainDisplayView Protocol
    
    func clearDisplay() {
        
        if let testResponse = self.testResponse {
            
            self.evaluateResponse(key: testResponse.testKey)
        }
    }
    
    func displayPowerfulResult(_ result: Bool, error: Error?) {
        
        if let testResponse = self.testResponse {
            
            self.evaluateResponse(key: testResponse.testKey, response: (result: result, error: error))
        }
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
        
        let testKey = "testClear"
        let expectationGuard = self.expectation(description: testKey)
        
        self.testResponse?.testKey = testKey
        self.testResponse?.expectation = expectationGuard
        
        //        self.testResponse?.results[testKey] = 1.0
        //        self.testResponse?.errors[testKey] = nil
        
        if let coordinator = self.coordinator  {
            
            coordinator.resetDisplay()
        }
        
        // *********************************
        
        waitForExpectations(timeout: 1) { error in
        }
    }
    
    func testPowerful() {
        
        let testKey = "testPowerful"
        let expectationGuard = self.expectation(description: testKey)
        
        self.testResponse?.testKey = testKey
        self.testResponse?.expectation = expectationGuard
        
        self.testResponse?.expectedResults[testKey] = true
        self.testResponse?.expectedErrors[testKey] = nil
        
        if let coordinator = self.coordinator  {
            
            self.testResponse?.expectation = expectationGuard
            coordinator.isNumberPowerful("1")
        }
        
        // *********************************
        
        waitForExpectations(timeout: 1) { error in
        }
    }
    
    func testPowerful_withResponseAction() {
        
        let testKey = "testPowerful_withResponseAction"
        let expectationGuard = self.expectation(description: testKey)
        
        self.testResponse?.testKey = testKey
        self.testResponse?.expectation = expectationGuard
        
        let closureName: ResultActionType = { (result: Any?, error: Error?) in
            
            if let error = error {
                
                XCTFail("Error in test/key: \(testKey): \(error)")
                return
            }
            
            if let result = result as? Bool {
                
                XCTAssert(result == true, "Failed to identify 1 as Powerful Number!!")
            }
        }
        
        
        self.testResponse?.responseActions[testKey] = closureName
        
        
        if let coordinator = self.coordinator  {
            
            self.testResponse?.expectation = expectationGuard
            coordinator.isNumberPowerful("1")
        }
        
        // *********************************
        
        waitForExpectations(timeout: 1) { error in
        }
    }
    
    
    func testComplement() {
        
        let testKey = "testComplement"
        let expectationGuard = self.expectation(description: testKey)
        
        self.testResponse?.testKey = testKey
        self.testResponse?.expectation = expectationGuard
        
        if let coordinator = self.coordinator  {
            
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
        self.testResponse?.expectation = expectationGuard
        
        self.testResponse?.expectedResults[testKey] = 1.0
        self.testResponse?.expectedErrors[testKey] = nil
        
        if let coordinator = self.coordinator  {
            
            coordinator.calculateFactorial("1")
        }
        
        // *********************************
        
        waitForExpectations(timeout: 1) { error in
        }
    }
    
    
    func testFactorial_5() {
        
        let testKey = "testFactorial_5"
        let expectationGuard = self.expectation(description: testKey)
        
        self.testResponse?.testKey = testKey
        self.testResponse?.expectation = expectationGuard
        
        self.testResponse?.expectedResults[testKey] = 120.0
        self.testResponse?.expectedErrors[testKey] = nil
        
        if let coordinator = self.coordinator  {
            
            coordinator.calculateFactorial("5")
        }
        
        // *********************************
        
        waitForExpectations(timeout: 1) { error in
        }
    }
    
    
    func testFactorial_5_withResponseAction() {
        
        let testKey = "testFactorial_5_withResponseAction"
        let expectationGuard = self.expectation(description: testKey)
        
        self.testResponse?.testKey = testKey
        self.testResponse?.expectation = expectationGuard

        self.testResponse?.responseActions[testKey] = { (result: Any?, error: Error?) in
            
            if let error = error {
                
                XCTFail("Error in test/key: \(testKey): \(error)")
                return
            }
            
            if let result = result as? Double {
                
                XCTAssert(result == 120.0, "Failed to calculate 120 as (5!)...")
                self.testResponse?.expectation?.fulfill()
            }
        }
        
        if let coordinator = self.coordinator  {
            
            coordinator.calculateFactorial("5")
        }
        
        // *********************************
        
        waitForExpectations(timeout: 1) { error in
        }
    }
    
    
    func testFactorial_8_withResponseAction() {
        
        let testKey = "testFactorial_8_withResponseAction"
        let expectationGuard = self.expectation(description: testKey)
        
        self.testResponse?.testKey = testKey
        self.testResponse?.expectation = expectationGuard

        self.testResponse?.responseActions[testKey] = { (result: Any?, error: Error?) in
            
            if let error = error {
                
                XCTFail("Error in test/key: \(testKey): \(error)")
                return
            }
            
            if let result = result as? Double {
                
                XCTAssert(result == 40320.0, "Failed to calculate 120 as (8!)...; got <\(result)>")
                self.testResponse?.expectation?.fulfill()
            }
        }
        
        if let coordinator = self.coordinator  {
            
            coordinator.calculateFactorial("8")
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
