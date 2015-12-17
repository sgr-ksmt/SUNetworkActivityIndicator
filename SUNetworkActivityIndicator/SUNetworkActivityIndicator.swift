//
//  SUNetworkActivityIndicator.swift
//
//  Created by Suguru Kishimoto on 2015/12/17.

import Foundation
import UIKit

public let NetworkActivityIndicatorActiveCountChangedNotification = "ActiveCountChanged"

public class NetworkActivityIndicator {
  
  private static let sharedInstance = NetworkActivityIndicator()
  
  private let syncQueue = dispatch_queue_create(
    "NetworkActivityIndicatorManager.syncQueue",
    DISPATCH_QUEUE_SERIAL
  )
  
  private(set) public var activeCount: Int {
    didSet {
      UIApplication.sharedApplication()
        .networkActivityIndicatorVisible = activeCount > 0
      if activeCount < 0 {
        activeCount = 0
      }
      NSNotificationCenter.defaultCenter().postNotificationName(
        NetworkActivityIndicatorActiveCountChangedNotification,
        object: activeCount
      )
    }
  }
  
  private init() {
    self.activeCount = 0
  }
  
  public class func shared() -> NetworkActivityIndicator {
    return sharedInstance
  }
  
  public func start() {
    dispatch_sync(syncQueue) { [unowned self] in
      self.activeCount += 1
    }
  }
  
  public func end() {
    dispatch_sync(syncQueue) { [unowned self] in
      self.activeCount -= 1
    }
  }
  
  public func endAll() {
    dispatch_sync(syncQueue) { [unowned self] in
      self.activeCount = 0
    }
  }
  
}
