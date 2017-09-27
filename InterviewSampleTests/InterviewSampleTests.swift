//
//  InterviewSampleTests.swift
//  InterviewSampleTests
//
//  Created by Eugen Fedchenko on 9/27/17.
//  Copyright © 2017 wirex. All rights reserved.
//

import XCTest
@testable import InterviewSample

class InterviewSampleTests: XCTestCase {
    
    var service: PixabayAPIService!
    
    override func setUp() {
        super.setUp()
        
        service = PixabayAPIServiceImpl()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testQuery() {
        let expc = expectation(description: "")
        
        service.query { (result, error) in
            XCTAssertNil(error)
            XCTAssertNotNil(result)
            expc.fulfill()
        }
        
        waitForExpectations(timeout: 30) { (err) in
            if let err = err {
                XCTFail(err.localizedDescription)
            }
        }
    }
    
}
