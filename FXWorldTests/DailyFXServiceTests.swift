//
//  DailyFXServiceTests.swift
//  FXWorldTests
//
//  Created by Aldo Bergamini on 28/01/2020.
//  Copyright © 2020 Frequency Communications. All rights reserved.
//

import XCTest


@testable import FXWorld


class DailyFXServiceTests: PluggableTestCase, ServiceClient {
  
    // MARK: Properties
    
    var service: DailyFXService?
    
    
    // MARK: - Setup
    
    override func setUp() {
        
        super.setUp()
        self.service = DailyFXService(withClient: self)
    }
    
    override func tearDown() {
        
        super.tearDown()
        self.service = nil
    }
    
    
    // MARK: - ServiceClient Interface
    
    func receive(status: Int?, result: Any?, error: Error?) {
        
        if let testResponse = self.testResponse {
            
            self.evaluateResponse(key: testResponse.testKey, response: (status: status, result: result, error: error))
        }
    }
    
    
    
    
    // MARK: - Unit TEST METHODS
    
    func test_DailyFXService_Setup() {
        
        let testKey = "test_DailyFXService_Setup"
        let expectationGuard = self.expectation(description: testKey)
        
        if let service = self.service {
            
            service.prepareRequestMethods()
            
            if service.ready {
                
                expectationGuard.fulfill()
            }
        }
        
        // *********************************
        
        waitForExpectations(timeout: 1) { error in
        }
    }
    
    
    func test_DailyFXService_SendRequest() {
        
        let testKey = "test_DailyFXService_SendRequest"
        let expectationGuard = self.expectation(description: testKey)
        
        self.testResponse?.testKey = testKey
        self.testResponse?.expectation = expectationGuard
        
        let closureBlock: ResultActionType = { (result: Any?, error: Error?) in
            
            if let error = error {
                
                XCTFail("Error in test/key: \(testKey): \(error)")
                return
            }
            
            if let result = result as? AllNews {
                
                XCTAssert(result.dailyBriefings.asia.count >= 0, "Failed to read any Asian briefing!!")
                expectationGuard.fulfill()
            }
        }
        
        self.testResponse?.responseActions[testKey] = closureBlock
        
        if let service = self.service {
            
            service.prepareRequestMethods()
            
            if service.ready {
                
                service.sendRequest(for: Endpoint.dashboard.rawValue, withData: nil)
            }
        }
        
        // *********************************
        
        waitForExpectations(timeout: 1) { error in
        }
    }
    
    
    func test_DailyFXService_SendDashboardRequest() {
        
        let testKey = "test_DailyFXService_SendDashboardRequest"
        let expectationGuard = self.expectation(description: testKey)
        
        self.testResponse?.testKey = testKey
        self.testResponse?.expectation = expectationGuard
        
        let closureBlock: ResultActionType = { (result: Any?, error: Error?) in
            
            if let error = error {
                
                XCTFail("Error in test/key: \(testKey): \(error)")
                return
            }
            
            if let result = result as? AllNews {
                
                XCTAssert(result.dailyBriefings.asia.count >= 0, "Failed to read any Asian briefing!!")
                expectationGuard.fulfill()
            }
        }
        
        self.testResponse?.responseActions[testKey] = closureBlock
        
        if let service = self.service {
            
            service.prepareRequestMethods()
            
            if service.ready {
                
                service.sendDashboardRequest()
            }
        }
        
        // *********************************
        
        waitForExpectations(timeout: 1) { error in
        }
    }
    
    
    func test_DailyFXService_SendMarketsRequest() {
        
        let testKey = "test_DailyFXService_SendMarketsRequest"
        let expectationGuard = self.expectation(description: testKey)
        
        self.testResponse?.testKey = testKey
        self.testResponse?.expectation = expectationGuard
        
        let closureBlock: ResultActionType = { (result: Any?, error: Error?) in
            
            if let error = error {
                
                XCTFail("Error in test/key: \(testKey): \(error)")
                return
            }
            
            if let result = result as? MarketsResponse {
                
                XCTAssert(result.currencies.count >= 0, "Failed to read any market curency info!!")
                expectationGuard.fulfill()
            }
        }
        
        self.testResponse?.responseActions[testKey] = closureBlock
        
        if let service = self.service {
            
            service.prepareRequestMethods()
            
            if service.ready {
                
                service.sendMarketsRequest()
            }
        }
        
        // *********************************
        
        waitForExpectations(timeout: 1) { error in
        }
    }

}
