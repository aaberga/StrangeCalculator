//
//  TestResponse.swift
//  Hello Coordinator
//
//  Created by Aldo Bergamini on 29/11/2019.
//  Copyright © 2019 iBat Inc. All rights reserved.
//

import XCTest

@testable import StrangeCalculator

typealias TestKey = String
typealias ResultType = (result: Any?, error: Error?)
typealias ResultActionType = (ResultType) -> Void


class TestResponse {
    
    var testKey: TestKey = ""
    var expectation: XCTestExpectation?

    var results: [String: Any] = [:]
    var errors: [String: Error] = [:]

    var data: [String: Any] = [:]

    var responseActions: [TestKey: ResultActionType] = [:]
}
