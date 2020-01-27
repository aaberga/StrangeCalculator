//
//  CoordinatorSampleTests.swift
//  CoordinatorSampleTests
//
//  Created by Aldo Bergamini on 27/01/2020.
//  Copyright © 2020 Frequency Communications. All rights reserved.
//

import XCTest


@testable import CoordinatorSample


class CoordinatorSampleTests: TargetViewTestCase, SampleDisplayView {
    
    
    // MARK: Properties
    
    var coordinator: SampleCoordinator?
    
    
    // MARK: - Setup
    
    override func setUp() {
        
        super.setUp()
        self.coordinator = SampleCoordinator(viewController: self)
    }
    
    override func tearDown() {
        
        super.tearDown()
        self.coordinator = nil
    }
    
    
    // MARK: - MainDisplayView Protocol Methods
    
    func clearDisplay() {
        
        if let testResponse = self.testResponse {
            
            self.evaluateResponse(key: testResponse.testKey)
        }
    }
    
    func displayCalculationResult(_ result: Bool, error: Error?) {
        
        if let testResponse = self.testResponse {
            
            self.evaluateResponse(key: testResponse.testKey, response: (result: result, error: error))
        }
    }

    
    
    // MARK: - Tests
    
    
    // MARK: • ResetDisplay
    
    func testClear() {
        
        let testKey = "testClear"
        let expectationGuard = self.expectation(description: testKey)
        
        self.testResponse?.testKey = testKey
        self.testResponse?.expectation = expectationGuard
        
        if let coordinator = self.coordinator  {
            
            coordinator.resetDisplay()
        }
        
        // *********************************
        
        waitForExpectations(timeout: 1) { error in
        }
    }
    
    
    // MARK: • How To Use Test Injection
    
    func testPowerful_ExpectedData() {
        
        let testKey = "testPowerful_ExpectedData"
        let expectationGuard = self.expectation(description: testKey)
        
        self.testResponse?.testKey = testKey
        self.testResponse?.expectation = expectationGuard
        
        self.testResponse?.expectedResults[testKey] = true
        self.testResponse?.expectedErrors[testKey] = nil
        
        if let coordinator = self.coordinator  {
            
            coordinator.doCalculation("1")
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
                expectationGuard.fulfill()
            }
        }
        
        self.testResponse?.responseActions[testKey] = closureName
        
        
        if let coordinator = self.coordinator  {
            
            self.testResponse?.expectation = expectationGuard
            coordinator.doCalculation("1")
        }
        
        // *********************************
        
        waitForExpectations(timeout: 1) { error in
        }
    }
    
 
    
    
    // MARK: - Performance Example
    
    func testPerformanceExample() {
        
        self.measure {
            
            let testKey = "testFactorial_8_testPerformanceExample"
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
                
                coordinator.doCalculation("8")
            }
        }
        
        // *********************************
        
        waitForExpectations(timeout: 1) { error in
        }
    }
}
