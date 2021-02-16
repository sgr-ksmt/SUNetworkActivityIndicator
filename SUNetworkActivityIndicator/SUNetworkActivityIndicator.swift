//
//  SUNetworkActivityIndicator.swift
//
//  Created by Suguru Kishimoto on 2015/12/17.

import Foundation
import UIKit

/// NetworkActivityIndicator
public class NetworkActivityIndicator {
  
  /// Singleton: shared instance
  public static let shared = NetworkActivityIndicator()
  
  /// enable sync access (like Objective-C's `@synchronized`)
  private let syncQueue = DispatchQueue(label: "NetworkActivityIndicatorManager.syncQueue", attributes: [])
  
  /**
   Notification name for `activeCount` changed.

   Contains `activeCount` in notification.object as `Int`
   */
  public static let ActiveCountChangedNotification = NSNotification.Name(rawValue: "ActiveCountChanged")
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
      UIApplication.shared.isNetworkActivityIndicatorVisible = activeCount > 0
      if activeCount < 0 {
        activeCount = 0
      }
      NotificationCenter.default.post(
        name: NetworkActivityIndicator.ActiveCountChangedNotification,
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
  
  /**
   Count up `activeCount` and `networkActivityIndicatorVisible` change to true.
   */
  public func start() {
    syncQueue.sync { [unowned self] in
      self.activeCount += 1
    }
  }
  
  /**
   Count down `activeCount` and if count is zero, `networkActivityIndicatorVisible` change to false.
   */
  public func end() {
    syncQueue.sync { [unowned self] in
      self.activeCount -= 1
    }
  }
  
  /**
   Reset `activeCount` and `networkActivityIndicatorVisible` change to false.
   */
  public func endAll() {
    syncQueue.sync { [unowned self] in
      self.activeCount = 0
    }
  }
  
}
