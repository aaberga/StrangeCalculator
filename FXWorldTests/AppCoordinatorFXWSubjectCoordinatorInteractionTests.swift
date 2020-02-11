//
//  AppCoordinatorFXWSubjectCoordinatorInteractionTests.swift
//  FXWorldTests
//
//  Created by Aldo Bergamini on 30/01/2020.
//  Copyright © 2020 Frequency Communications. All rights reserved.
//

import XCTest


@testable import FXWorld

class AppCoordinatorFXWSubjectCoordinatorInteractionTests: PluggableTestCase, ViewTarget, FXDataProtocol  {
    
    
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
    
}
