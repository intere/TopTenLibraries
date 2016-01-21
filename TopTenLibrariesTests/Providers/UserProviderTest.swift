//
//  UserProviderTest.swift
//  TopTenLibraries
//
//  Created by Eric Internicola on 1/21/16.
//  Copyright © 2016 Eric Internicola. All rights reserved.
//

@testable import TopTenLibraries
import XCTest

class UserProviderTest: XCTestCase {
    
    func testLoadUsers() {
        let expectation = expectationWithDescription("User Load")
        
        UserProvider.instance.loadUsers() { (result, error) -> (Void) in
            XCTAssertNotNil(result, "The result was nil")
            XCTAssertNil(error, "The error was not nil: \(error)")
            expectation.fulfill()
        }
        
        waitForExpectationsWithTimeout(10, handler: nil)
    }
    
}
