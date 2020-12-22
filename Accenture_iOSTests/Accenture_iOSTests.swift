//
//  Accenture_iOSTests.swift
//  Accenture_iOSTests
//
//  Created by XTGlobal on 21/12/20.
//  Copyright © 2020 Goutham. All rights reserved.
//

import XCTest
@testable import Accenture_iOS

class Accenture_iOSTests: XCTestCase {
    
    
    var apiService: APIService!
    var session : URLSession!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    func test_get_request_withURL() {
        
        guard let url = URL(string: "https://api.mocki.io/v1/4f436f3b") else {
            fatalError("URL can't be empty")
        }
        
        URLSession.shared.dataTask(with: url) { (data, urlResponse, error) in
            if error != nil
            {
                XCTFail("Fail")
            }
        }
        
         self.waitForExpectations(timeout: 20)
        
    }
    
    

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
