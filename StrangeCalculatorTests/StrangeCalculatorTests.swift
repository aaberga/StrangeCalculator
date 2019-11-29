//
//  StrangeCalculatorTests.swift
//  StrangeCalculatorTests
//
//  Created by Aldo Bergamini on 26/11/2019.
//  Copyright © 2019 Aldo Bergamini. All rights reserved.
//

import XCTest
@testable import StrangeCalculator

class StrangeCalculatorTests: XCTestCase, MainDisplayView {
    
    // Properties
    
    var expectations: [String: XCTestExpectation] = [:]
    var results: [String: Any] = [:]
    var errors: [String: Error] = [:]

    var coordinator: MainCoordinator?
 
    
    // Setup
    
    override func setUp() {
        
        self.coordinator = MainCoordinator(mainController: self)
    }

    override func tearDown() {

    }

    
    // MainDisplayView Protocol
    
    func clearDisplay() {
        
        if let currentExpectation = self.expectations["testPowerful"] {
            currentExpectation.fulfill()
        }
    }
    
    func displayPowerfulResult(_ result: Bool, error: Error?) {
        
        if let currentExpectation = self.expectations["testPowerful"] {
            
            if let expectedError = self.errors["testPowerful"] {
                
                if let error = error {
                    
                    if error.localizedDescription == expectedError.localizedDescription {
                        
                        currentExpectation.fulfill()
                    }
                }
            }
            
            if let expectedResult = self.results["testPowerful"] as? Bool {
                
                if result == expectedResult {
                    
                    currentExpectation.fulfill()
                }
            }
        }
    }
    
    func displayComplementResult(_ result: NSInteger, error: Error?) {
        
    }
    
    func displayFactorialResult(_ result: Double, error: Error?) {
        
        if let currentExpectation = self.expectations["testFactorial"] {

            if let expectedError = self.errors["testFactorial"] {
                
                if let error = error {
                    
                    if error.localizedDescription == expectedError.localizedDescription {
                        
                        currentExpectation.fulfill()
                    }
                }
            }
            
            if let expectedResult = self.results["testFactorial"] as? Double {
                
                if result == expectedResult {
                    
                    currentExpectation.fulfill()
                }
            }
        }
    }
    
    
    // Tests
    
    func testClear() {
        
        let expectationGuard = self.expectation(description: "testClear")

        if let coordinator = self.coordinator  {
            
            self.expectations["testClear"] = expectationGuard
            coordinator.resetDisplay()        
        }
        
        // *********************************
        
        waitForExpectations(timeout: 1) { error in
        }
    }

    func testPowerful() {
        
        let expectationGuard = self.expectation(description: "testPowerful")
        
        self.results["testPowerful"] = true
        self.errors["testPowerful"] = nil
        
        if let coordinator = self.coordinator  {
            
            self.expectations["testPowerful"] = expectationGuard
            coordinator.isNumberPowerful("1")
        }
        
        // *********************************
        
        waitForExpectations(timeout: 1) { error in
        }
    }
 
    
    func testComplement() {
        
        let expectationGuard = self.expectation(description: "testComplement")

        if let coordinator = self.coordinator  {
            
            self.expectations["testComplement"] = expectationGuard
            coordinator.calculateComplement("1")
        }
        
        // *********************************
        
        waitForExpectations(timeout: 1) { error in
        }

    }

    
    func testFactorial() {
        
        let expectationGuard = self.expectation(description: "testFactorial")

        self.results["testFactorial"] = 1.0
        self.errors["testFactorial"] = nil
        
        if let coordinator = self.coordinator  {
            
            self.expectations["testFactorial"] = expectationGuard
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
