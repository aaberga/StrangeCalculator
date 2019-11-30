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
    
    // MARK: Properties
    
    var coordinator: MainCoordinator?
    
    
    // MARK: - Setup
    
    override func setUp() {
        
        super.setUp()
        self.coordinator = MainCoordinator(mainController: self)
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
                expectationGuard.fulfill()
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
    
    
    // MARK: • Powerful
    
    func testPowerful_3() {
        
        let testKey = "testPowerful_3"
        let expectationGuard = self.expectation(description: testKey)
        let expectedResult = false

        self.testResponse?.testKey = testKey
        self.testResponse?.expectation = expectationGuard
        
        self.testResponse?.responseActions[testKey] = { (result: Any?, error: Error?) in
            
            if let error = error {
                
                XCTFail("Error in test/key: \(testKey): \(error)")
                return
            }
            
            if let result = result as? Bool {
                
                XCTAssert(result == expectedResult, "Failed to identify 3 as non Powerful Number!!")
                expectationGuard.fulfill()
            }
        }
        
        if let coordinator = self.coordinator  {
            
            self.testResponse?.expectation = expectationGuard
            coordinator.isNumberPowerful("3")
        }
        
        // *********************************
        
        waitForExpectations(timeout: 1) { error in
        }
    }
    
    func testPowerful_5() {
        
        let testKey = "testPowerful_5"
        let expectationGuard = self.expectation(description: testKey)
        let expectedResult = false

        self.testResponse?.testKey = testKey
        self.testResponse?.expectation = expectationGuard
        
        self.testResponse?.responseActions[testKey] = { (result: Any?, error: Error?) in
            
            if let error = error {
                
                XCTFail("Error in test/key: \(testKey): \(error)")
                return
            }
            
            if let result = result as? Bool {
                
                XCTAssert(result == expectedResult, "Failed to identify 5 as non Powerful Number!!")
                expectationGuard.fulfill()
            }
        }
        
        if let coordinator = self.coordinator  {
            
            self.testResponse?.expectation = expectationGuard
            coordinator.isNumberPowerful("5")
        }
        
        // *********************************
        
        waitForExpectations(timeout: 1) { error in
        }
    }
    
    func testPowerful_20() {
        
        let testKey = "testPowerful_20"
        let expectationGuard = self.expectation(description: testKey)
        let expectedResult = false

        self.testResponse?.testKey = testKey
        self.testResponse?.expectation = expectationGuard
        
        self.testResponse?.responseActions[testKey] = { (result: Any?, error: Error?) in
            
            if let error = error {
                
                XCTFail("Error in test/key: \(testKey): \(error)")
                return
            }
            
            if let result = result as? Bool {
                
                XCTAssert(result == expectedResult, "Failed to identify 20 as non Powerful Number!!")
                expectationGuard.fulfill()
            }
        }
        
        if let coordinator = self.coordinator  {
            
            coordinator.isNumberPowerful("20")
        }
        
        // *********************************
        
        waitForExpectations(timeout: 1) { error in
        }
    }
    
    func testPowerful_27() {
        
        let testKey = "testPowerful_27"
        let expectationGuard = self.expectation(description: testKey)
        let expectedResult = true

        self.testResponse?.testKey = testKey
        self.testResponse?.expectation = expectationGuard
        
        self.testResponse?.responseActions[testKey] = { (result: Any?, error: Error?) in
            
            if let error = error {
                
                XCTFail("Error in test/key: \(testKey): \(error)")
                return
            }
            
            if let result = result as? Bool {
                
                XCTAssert(result == expectedResult, "Failed to identify 36 as Powerful Number!!")
                expectationGuard.fulfill()
            }
        }
        
        if let coordinator = self.coordinator  {
            
            coordinator.isNumberPowerful("27")
        }
        
        // *********************************
        
        waitForExpectations(timeout: 1) { error in
        }
    }
    
    func testPowerful_36() {
        
        let testKey = "testPowerful_36"
        let expectationGuard = self.expectation(description: testKey)
        let expectedResult = true

        self.testResponse?.testKey = testKey
        self.testResponse?.expectation = expectationGuard
        
        self.testResponse?.responseActions[testKey] = { (result: Any?, error: Error?) in
            
            if let error = error {
                
                XCTFail("Error in test/key: \(testKey): \(error)")
                return
            }
            
            if let result = result as? Bool {
                
                XCTAssert(result == expectedResult, "Failed to identify 36 as Powerful Number!!")
                expectationGuard.fulfill()
            }
        }
        
        if let coordinator = self.coordinator  {
            
            coordinator.isNumberPowerful("36")
        }
        
        // *********************************
        
        waitForExpectations(timeout: 1) { error in
        }
    }
    
    func testPowerful_44() {
        
        let testKey = "testPowerful_44"
        let expectationGuard = self.expectation(description: testKey)
        let expectedResult = false

        self.testResponse?.testKey = testKey
        self.testResponse?.expectation = expectationGuard
        
        self.testResponse?.responseActions[testKey] = { (result: Any?, error: Error?) in
            
            if let error = error {
                
                XCTFail("Error in test/key: \(testKey): \(error)")
                return
            }
            
            if let result = result as? Bool {
                
                XCTAssert(result == expectedResult, "Failed to identify 44 as non Powerful Number!!")
                expectationGuard.fulfill()
            }
        }
        
        if let coordinator = self.coordinator  {
            
            coordinator.isNumberPowerful("44")
        }
        
        // *********************************
        
        waitForExpectations(timeout: 1) { error in
        }
    }

    func testPowerful_45() {
        
        let testKey = "testPowerful_45"
        let expectationGuard = self.expectation(description: testKey)
        let expectedResult = false

        self.testResponse?.testKey = testKey
        self.testResponse?.expectation = expectationGuard
        
        self.testResponse?.responseActions[testKey] = { (result: Any?, error: Error?) in
            
            if let error = error {
                
                XCTFail("Error in test/key: \(testKey): \(error)")
                return
            }
            
            if let result = result as? Bool {
                
                XCTAssert(result == expectedResult, "Failed to identify 45 as non Powerful Number!!")
                expectationGuard.fulfill()
            }
        }
        
        if let coordinator = self.coordinator  {
            
            coordinator.isNumberPowerful("45")
        }
        
        // *********************************
        
        waitForExpectations(timeout: 1) { error in
        }
    }

    func testPowerful_144() {
        
        let testKey = "testPowerful_144"
        let expectationGuard = self.expectation(description: testKey)
        let expectedResult = true

        self.testResponse?.testKey = testKey
        self.testResponse?.expectation = expectationGuard
        
        self.testResponse?.responseActions[testKey] = { (result: Any?, error: Error?) in
            
            if let error = error {
                
                XCTFail("Error in test/key: \(testKey): \(error)")
                return
            }
            
            if let result = result as? Bool {
                
                XCTAssert(result == expectedResult, "Failed to identify 144 as non Powerful Number!!")
                expectationGuard.fulfill()
            }
        }
        
        if let coordinator = self.coordinator  {
            
            coordinator.isNumberPowerful("144")
        }
        
        // *********************************
        
        waitForExpectations(timeout: 1) { error in
        }
    }
    
    func testPowerful_625() {
        
        let testKey = "testPowerful_625"
        let expectationGuard = self.expectation(description: testKey)
        let expectedResult = true

        self.testResponse?.testKey = testKey
        self.testResponse?.expectation = expectationGuard
        
        self.testResponse?.responseActions[testKey] = { (result: Any?, error: Error?) in
            
            if let error = error {
                
                XCTFail("Error in test/key: \(testKey): \(error)")
                return
            }
            
            if let result = result as? Bool {
                
                XCTAssert(result == expectedResult, "Failed to identify 625 as non Powerful Number!!")
                expectationGuard.fulfill()
            }
        }
        
        if let coordinator = self.coordinator  {
            
            coordinator.isNumberPowerful("625")
        }
        
        // *********************************
        
        waitForExpectations(timeout: 1) { error in
        }
    }

    func testPowerful_626() {
        
        let testKey = "testPowerful_626"
        let expectationGuard = self.expectation(description: testKey)
        let expectedResult = false

        self.testResponse?.testKey = testKey
        self.testResponse?.expectation = expectationGuard
        
        self.testResponse?.responseActions[testKey] = { (result: Any?, error: Error?) in
            
            if let error = error {
                
                XCTFail("Error in test/key: \(testKey): \(error)")
                return
            }
            
            if let result = result as? Bool {
                
                XCTAssert(result == expectedResult, "Failed to identify 626 as non Powerful Number!!")
                expectationGuard.fulfill()
            }
        }
        
        if let coordinator = self.coordinator  {
            
            coordinator.isNumberPowerful("626")
        }
        
        // *********************************
        
        waitForExpectations(timeout: 1) { error in
        }
    }

    // MARK: • Complement
    
    func testComplement_1() {
        
        let testKey = "testComplement_1"
        let expectationGuard = self.expectation(description: testKey)
        let expectedResult = 1

        self.testResponse?.testKey = testKey
        self.testResponse?.expectation = expectationGuard
                
        self.testResponse?.responseActions[testKey] = { (result: Any?, error: Error?) in
            
            if let error = error {
                
                XCTFail("Error in test/key: \(testKey): \(error)")
                return
            }
            
            if let result = result as? NSInteger {
                
                XCTAssert(result == expectedResult, "Failed to calculate complement to 1!!")
                expectationGuard.fulfill()
            }
        }

        if let coordinator = self.coordinator  {
            
            coordinator.calculateComplement("1")
        }
        
        // *********************************
        
        waitForExpectations(timeout: 1) { error in
        }
    }
        
    func testComplement_10() {
        
        let testKey = "testComplement_10"
        let expectationGuard = self.expectation(description: testKey)
        let expectedResult = 10

        self.testResponse?.testKey = testKey
        self.testResponse?.expectation = expectationGuard
                
        self.testResponse?.responseActions[testKey] = { (result: Any?, error: Error?) in
            
            if let error = error {
                
                XCTFail("Error in test/key: \(testKey): \(error)")
                return
            }
            
            if let result = result as? NSInteger {
                
                XCTAssert(result == expectedResult, "Failed to calculate complement to 10!!")
                expectationGuard.fulfill()
            }
        }

        if let coordinator = self.coordinator  {
            
            coordinator.calculateComplement("10")
        }
        
        // *********************************
        
        waitForExpectations(timeout: 1) { error in
        }
    }
        
    func testComplement_100() {
        
        let testKey = "testComplement_100"
        let expectationGuard = self.expectation(description: testKey)
        let expectedResult = 100

        self.testResponse?.testKey = testKey
        self.testResponse?.expectation = expectationGuard
                
        self.testResponse?.responseActions[testKey] = { (result: Any?, error: Error?) in
            
            if let error = error {
                
                XCTFail("Error in test/key: \(testKey): \(error)")
                return
            }
            
            if let result = result as? NSInteger {
                
                XCTAssert(result == expectedResult, "Failed to calculate complement to 100!!")
                expectationGuard.fulfill()
            }
        }

        if let coordinator = self.coordinator  {
            
            coordinator.calculateComplement("100")
        }
        
        // *********************************
        
        waitForExpectations(timeout: 1) { error in
        }
    }
    

    // MARK: • Factorial
    
    func testFactorial_1() {
        
        let testKey = "testFactorial_1"
        let expectationGuard = self.expectation(description: testKey)
        let expectedResult = 1

        self.testResponse?.testKey = testKey
        self.testResponse?.expectation = expectationGuard
        
        self.testResponse?.expectedResults[testKey] = expectedResult
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
        let expectedResult = 120.0

        self.testResponse?.testKey = testKey
        self.testResponse?.expectation = expectationGuard
        
        self.testResponse?.expectedResults[testKey] = expectedResult
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
        let expectedResult = 120.0

        self.testResponse?.testKey = testKey
        self.testResponse?.expectation = expectationGuard
        
        self.testResponse?.responseActions[testKey] = { (result: Any?, error: Error?) in
            
            if let error = error {
                
                XCTFail("Error in test/key: \(testKey): \(error)")
                return
            }
            
            if let result = result as? Double {
                
                XCTAssert(result == expectedResult, "Failed to calculate 120 as (5!)...")
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
                
                coordinator.calculateFactorial("8")
            }
        }
        
        // *********************************
        
        waitForExpectations(timeout: 1) { error in
        }
    }
}
