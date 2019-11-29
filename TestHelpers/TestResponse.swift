//
//  TestResponse.swift
//  Hello Coordinator
//
//  Created by Aldo Bergamini on 29/11/2019.
//  Copyright © 2019 iBat Inc. All rights reserved.
//

import Foundation
import XCTest

@testable import Hello_Coordinator


typealias ResultActionType = (Any, Error?) -> Void
typealias TestKey = String


class TestResponse {
    
    var expectation: XCTestExpectation?

    var results: [String: Any] = [:]
    var errors: [String: Error] = [:]

    var responseActions: [TestKey: ResultActionType] = [:]
}
