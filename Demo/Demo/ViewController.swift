//
//  ViewController.swift
//  Demo
//
//  Created by Suguru Kishimoto on 2015/12/17.

import UIKit

import SUNetworkActivityIndicator
class ViewController: UIViewController {
  
  @IBOutlet private weak var countLabel: UILabel!
  @IBOutlet private weak var resetButton: UIButton! {
    didSet {
      resetButton.enabled = false
    }
  }
  
  @IBOutlet private weak var tableView: UITableView! {
    didSet {
      tableView.registerNib(
        UINib(nibName: "Cell", bundle: nil),
        forCellReuseIdentifier: "Cell"
      )
      tableView.tableFooterView = UIView()
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    NSNotificationCenter.defaultCenter().addObserver(
      self,
      selector: "activeCountChanged:",
      name: NetworkActivityIndicatorActiveCountChangedNotification,
      object: nil)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  @objc @IBAction private func endAll(sender: AnyObject!) {
    NetworkActivityIndicator.shared().endAll()
    tableView.visibleCells.forEach {
      let cell = $0 as! Cell
      cell.end()
    }
  }
  
  @objc private func activeCountChanged(notification: NSNotification) {
    let count = notification.object as! Int
    countLabel.text = "Count : \(count)"
    resetButton.enabled = count > 0
  }
  
}

private typealias DataSource = ViewController
extension DataSource: UITableViewDataSource {
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 5
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell: Cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! Cell
    cell.configureWithNumber(indexPath.row + 1)
    return cell
  }
  
}

private typealias Delegate = ViewController
extension Delegate: UITableViewDelegate {
  
}
