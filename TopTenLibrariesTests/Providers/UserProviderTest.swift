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
        
        UserProvider.instance.loadUsers() { (data, error) -> (Void) in
            XCTAssertNotNil(data, "The data was nil")
            XCTAssertNil(error, "The error was not nil: \(error)")
            if let data = data, users = User.fromJsonData(data) {
                XCTAssertTrue(users.count > 0, "We didn't get any users back")
                for user in users {
                    XCTAssertNotEqual(-1, user.id, "Incorrect ID")
                    XCTAssertNotEqual("", user.name, "Incorrect Name")
                    XCTAssertNotEqual("", user.email, "Incorrect Email")
                    XCTAssertNotEqual("", user.phone, "Incorrect Phone")
                    XCTAssertNotEqual("", user.website, "Incorrect Website")
                }
            } else {
                XCTFail("Failed to create users from data")
            }
            expectation.fulfill()
        }
        
        waitForExpectationsWithTimeout(10, handler: nil)
    }
    
}
