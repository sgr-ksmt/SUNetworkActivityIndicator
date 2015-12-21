//
//  SUNetworkActivityIndicator.swift
//
//  Created by Suguru Kishimoto on 2015/12/17.

import Foundation
import UIKit

/**
 Notification name for `activeCount` changed.

 Contains `activeCount` in notification.object as `Int`
 */
public let NetworkActivityIndicatorActiveCountChangedNotification = "ActiveCountChanged"

/// NetworkActivityIndicator
public class NetworkActivityIndicator {
  
  /// Singleton: shared instance (private var)
  private static let sharedInstance = NetworkActivityIndicator()
  
  /// enable sync access (like Objective-C's `@synchronized`)
  private let syncQueue = dispatch_queue_create(
    "NetworkActivityIndicatorManager.syncQueue",
    DISPATCH_QUEUE_SERIAL
  )
  
  /**
   ActiveCount
  
   If count is above 0,
  
   ```
   UIApplication.sharedApplication().networkActivityIndicatorVisible
   ```
  
   is true, else false.
  */
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
  
  /**
   Initializer (private)
  
   - returns: instance
   */
  private init() {
    self.activeCount = 0
  }
  
  public class func shared() -> NetworkActivityIndicator {
    return sharedInstance
  }
  
  /**
   Count up `activeCount` and `networkActivityIndicatorVisible` change to true.
   */
  public func start() {
    dispatch_sync(syncQueue) { [unowned self] in
      self.activeCount += 1
    }
  }
  
  /**
   Count down `activeCount` and if count is zero, `networkActivityIndicatorVisible` change to false.
   */
  public func end() {
    dispatch_sync(syncQueue) { [unowned self] in
      self.activeCount -= 1
    }
  }
  
  /**
   Reset `activeCount` and `networkActivityIndicatorVisible` change to false.
   */
  public func endAll() {
    dispatch_sync(syncQueue) { [unowned self] in
      self.activeCount = 0
    }
  }
  
}
