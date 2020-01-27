//
//  TestResponse.swift
//  Hello Coordinator
//
//  Created by Aldo Bergamini on 29/11/2019.
//  Copyright © 2019 iBat Inc. All rights reserved.
//

import XCTest

@testable import CoordinatorSample

typealias TestKey = String
typealias ResultType = (result: Any?, error: Error?)
typealias ResultActionType = (_ result: Any?, _ error: Error?) -> Void


class TestResponse {
    
    var testKey: TestKey = ""
    var expectation: XCTestExpectation?

    var expectedResults: [String: Any] = [:]
    var expectedErrors: [String: Error] = [:]

    var data: [String: Any] = [:]

    var responseActions: [TestKey: ResultActionType] = [:]
}
