# SUNetworkActivityIndicator

[![Version](https://img.shields.io/cocoapods/v/SUNetworkActivityIndicator.svg?style=flat)](http://cocoapods.org/pods/SUNetworkActivityIndicator)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![License](https://img.shields.io/cocoapods/l/SUNetworkActivityIndicator.svg?style=flat)](http://cocoapods.org/pods/SUNetworkActivityIndicator)
[![Platform](https://img.shields.io/cocoapods/p/SUNetworkActivityIndicator.svg?style=flat)](http://cocoapods.org/pods/SUNetworkActivityIndicator)

## Features
- [x] Easy active/inactive
- [x] Multiple management of indicator's state

## How to use

**before :**

```swift
// usual usage
UIApplication.sharedApplication().networkActivityIndicatorVisible = true
UIApplication.sharedApplication().networkActivityIndicatorVisible = false

class SomeClass {
  var connectionCount: Int

  init() {
    connectionCount = 0
  }

  func getData() {
    doConnection1()
    doConnection2()
  }

  func doConnection1() {
    UIApplication.sharedApplication().networkActivityIndicatorVisible = true
    connectionCount += 1
    // some async connection
  }

  func endConnection1() {
    if connectionCount == 0 {
      UIApplication.sharedApplication().networkActivityIndicatorVisible = false
    }
  }

  func doConnection2() {
    UIApplication.sharedApplication().networkActivityIndicatorVisible = true
    connectionCount += 1
    // some async connection
  }

  func endConnection2() {
    if connectionCount == 0 {
      UIApplication.sharedApplication().networkActivityIndicatorVisible = false
    }
  }
}
```

**after**

```swift
// usual usage
NetworkActivityIndicator.shared.start()
NetworkActivityIndicator.shared.end()

class SomeClass {
  init() {
  }

  func getData() {
    doConnection1()
    doConnection2()
  }

  func doConnection1() {
    NetworkActivityIndicator.shared.start()
    // some async connection
  }

  func endConnection1() {
    NetworkActivityIndicator.shared.end()
    // if `activeCount` is above 0, remain indicator visible.
  }

  func doConnection2() {
    NetworkActivityIndicator.shared.start()
    // some async connection
  }

  func endConnection2() {
    NetworkActivityIndicator.shared.end()
    // if `activeCount` is above 0, remain indicator visible.
  }
}

```

**Example is [here](https://github.com/sgr-ksmt/SUNetworkActivityIndicator/blob/master/Demo/)**

## Requirements
- iOS 8.0+
- Xcode 10.2+ / Swift 5+ (See version 0.1 for Swift 2)

## Installation and Setup

### With CocoaPods

**SUNetworkActivityIndicator** is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SUNetworkActivityIndicator'
```

and run `pod install`

### With Carthage

### Carthage

- Add the following to your *Cartfile*:

```bash
github "sgr-ksmt/SUNetworkActivityIndicator"
```

- Run `carthage update`
- Add the framework as described.
<br> Details: [Carthage Readme](https://github.com/Carthage/Carthage#adding-frameworks-to-an-application)

### Manual install (iOS7)
Clone this repository, then add `SUNetworkActivityIndicator.swift` to your Xcode Project.