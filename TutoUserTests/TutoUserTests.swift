//
//  TutoUserTests.swift
//  TutoUserTests
//
//  Created by Benjamin Dumont on 16/03/2016.
//  Copyright © 2016 bdumont. All rights reserved.
//

import XCTest

class TutoUserTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testIsEmpty() {
        XCTAssertTrue("".isEmpty)
        XCTAssertTrue(" ".isEmpty)
        XCTAssertTrue("  ".isEmpty)
        XCTAssertFalse("Hello World".isEmpty)
        XCTAssertFalse(" Hello World".isEmpty)
        XCTAssertFalse("Hello World ".isEmpty)
        XCTAssertFalse(" Hello World ".isEmpty)
    }
    
    
    func testTrim() {
        XCTAssertTrue("".trim() == "")
        XCTAssertTrue(" ".trim() == "")
        XCTAssertTrue("  ".trim() == "")
        XCTAssertTrue("Hello World".trim() == "Hello World")
        XCTAssertTrue(" Hello World".trim() == "Hello World")
        XCTAssertTrue("Hello World ".trim() == "Hello World")
        XCTAssertTrue(" Hello World ".trim() == "Hello World")
    }

    
}
