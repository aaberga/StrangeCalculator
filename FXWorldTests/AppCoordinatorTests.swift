//
//  AppCoordinatorTests.swift
//  FXWorldTests
//
//  Created by Aldo Bergamini on 28/01/2020.
//  Copyright © 2020 Frequency Communications. All rights reserved.
//

import XCTest


@testable import FXWorld

class AppCoordinatorTests: PluggableTestCase, ViewTarget, FXDataProtocol  {
    
    
    // MARK: Properties
    
        var coordinator: Coordinator?

    
    // MARK: - Setup
    
    override func setUp() {
        
        super.setUp()
        self.coordinator = AppCoordinator(target: self)
    }
    
    override func tearDown() {
        
        super.tearDown()
        self.coordinator = nil
    }
    
    
    // MARK: - FXDataProtocol Protocol Methods
    
    func dataDelivered() {
        
        if let testResponse = self.testResponse {
             
             self.evaluateResponse(key: testResponse.testKey, response: (status: nil, result: "Data Delivered", error: nil))
        }
    }

    func receiveNewsModel(_ allNews: AllNews) {
        
        if let testResponse = self.testResponse {
             
             self.evaluateResponse(key: testResponse.testKey, response: (status: nil, result: allNews, error: nil))
         }
    }
    
    func refreshMarketsResponseModel(_ marketsResponse: MarketsResponse) {
        
        if let testResponse = self.testResponse {
             
             self.evaluateResponse(key: testResponse.testKey, response: (status: nil, result: marketsResponse, error: nil))
         }
    }

    
    
    
    // MARK: - Unit TEST METHODS
    
    func test_AppCoordinator_Setup() {
        
        let testKey = "test_AppCoordinator_Setup"
        let expectationGuard = self.expectation(description: testKey)
        
        self.testResponse?.testKey = testKey
        self.testResponse?.expectation = expectationGuard
        
        let closureName: ResultActionType = { (result: Any?, error: Error?) in
            
            if let error = error {
                
                XCTFail("Error in test/key: \(testKey): \(error)")
                return
            }
            
            if let result = result as? Bool {
                
                XCTAssert(result == true, "Failed to start the AppCoordinator!!")
                expectationGuard.fulfill()
            }
        }
        
        self.testResponse?.responseActions[testKey] = closureName
        
        if let coordinator = self.coordinator as? AppCoordinator {
            
            self.testResponse?.expectation = expectationGuard
            coordinator.start()
            
            if let _ = coordinator.apiService as? DailyFXService {
                
                expectationGuard.fulfill()
            }
        }
        
        // *********************************
        
        waitForExpectations(timeout: 1) { error in
        }
    }
    
    func test_AppCoordinator_LoadData() {
        
        let testKey = "test_AppCoordinator_LoadData"
        let expectationGuard = self.expectation(description: testKey)
        
        self.testResponse?.testKey = testKey
        self.testResponse?.expectation = expectationGuard
        
        let closureName: ResultActionType = { (result: Any?, error: Error?) in
                        
            if let error = error {
                
                XCTFail("Error in test/key: \(testKey): \(error)")
                return
            }
            
            if let result = result as? AllNews {
                
                XCTAssert(result.dailyBriefings.eu.count > 0, "Failed to load FXWorld api data!!")
                expectationGuard.fulfill()
            }
            
            if let result = result as? MarketsResponse {
                
                XCTAssert(result.commodities.count > 0, "Failed to load FXWorld api data!!")
                expectationGuard.fulfill()
            }
        }
        
        self.testResponse?.responseActions[testKey] = closureName
        
        if let coordinator = self.coordinator as? AppCoordinator {
            
            self.testResponse?.expectation = expectationGuard
            coordinator.start()
            
            let requestSent = coordinator.loadFXData()
            
            if !requestSent {
                
                XCTFail("Error!! Did not start API request!")
            }
        }
        
        // *********************************
        
        waitForExpectations(timeout: 2) { error in
        }
    }

    
    
}
