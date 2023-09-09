//
//  WalmartAppTests.swift
//  WalmartAppTests
//
//  Created by Luis R on 08/09/23.
//

import XCTest
@testable import WalmartApp

final class WalmartAppTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
    
 
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
   // Exercise 5: Unit Testing
    func testSumOfEvenNumbers() {
        let numbers = [1, 2, 3, 4, 5, 6, 7, 8]
        
        // Act: Call the sumOfEvenNumbers function
        let evenSum = sumOfEvenNumbers(numbers)
        
        // Assert: Check if the result is as expected
        XCTAssertEqual(evenSum, 20, "Sum of even numbers should be 20")
    }
    
    
    // Test case for an empty array
      func testEmptyArray() {
          // Arrange: Create an empty array of integers
          let numbers: [Int] = []
          
          // Act: Call the sumOfEvenNumbers function
          let evenSum = sumOfEvenNumbers(numbers)
          
          // Assert: Check if the result is zero for an empty array
          XCTAssertEqual(evenSum, 0, "Sum of even numbers in an empty array should be 0")
      }
}
