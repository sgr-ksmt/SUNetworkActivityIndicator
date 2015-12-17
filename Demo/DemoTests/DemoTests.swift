//
//  DemoTests.swift
//  DemoTests
//
//  Created by Suguru Kishimoto on 2015/12/17.

import XCTest

import UIKit
import SUNetworkActivityIndicator

@testable import Demo

class DemoTests: XCTestCase {
  
  override func setUp() {
    super.setUp()
  }
  
  override func tearDown() {
    super.tearDown()
  }
  
  func testIndicatorActiveCount() {
    NetworkActivityIndicator.shared().start()
    XCTAssertEqual(NetworkActivityIndicator.shared().activeCount, 1)
    XCTAssertTrue(UIApplication.sharedApplication().networkActivityIndicatorVisible)
    NetworkActivityIndicator.shared().start()
    NetworkActivityIndicator.shared().start()
    NetworkActivityIndicator.shared().start()
    NetworkActivityIndicator.shared().start()
    XCTAssertEqual(NetworkActivityIndicator.shared().activeCount, 5)
    XCTAssertTrue(UIApplication.sharedApplication().networkActivityIndicatorVisible)
    NetworkActivityIndicator.shared().end()
    XCTAssertEqual(NetworkActivityIndicator.shared().activeCount, 4)
    XCTAssertTrue(UIApplication.sharedApplication().networkActivityIndicatorVisible)
    NetworkActivityIndicator.shared().end()
    NetworkActivityIndicator.shared().end()
    NetworkActivityIndicator.shared().end()
    NetworkActivityIndicator.shared().end()
    XCTAssertEqual(NetworkActivityIndicator.shared().activeCount, 0)
    XCTAssertFalse(UIApplication.sharedApplication().networkActivityIndicatorVisible)
  }
  
  func testEndAll() {
    NetworkActivityIndicator.shared().start()
    XCTAssertEqual(NetworkActivityIndicator.shared().activeCount, 1)
    XCTAssertTrue(UIApplication.sharedApplication().networkActivityIndicatorVisible)
    NetworkActivityIndicator.shared().start()
    NetworkActivityIndicator.shared().start()
    NetworkActivityIndicator.shared().start()
    NetworkActivityIndicator.shared().start()
    XCTAssertEqual(NetworkActivityIndicator.shared().activeCount, 5)
    XCTAssertTrue(UIApplication.sharedApplication().networkActivityIndicatorVisible)
    NetworkActivityIndicator.shared().end()
    XCTAssertEqual(NetworkActivityIndicator.shared().activeCount, 4)
    XCTAssertTrue(UIApplication.sharedApplication().networkActivityIndicatorVisible)
    NetworkActivityIndicator.shared().endAll()
    XCTAssertEqual(NetworkActivityIndicator.shared().activeCount, 0)
    XCTAssertFalse(UIApplication.sharedApplication().networkActivityIndicatorVisible)
  }
  
  //TODO: test async
  
  func testPerformanceExample() {
    // This is an example of a performance test case.
    self.measureBlock {
      // Put the code you want to measure the time of here.
    }
  }
  
}
