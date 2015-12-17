//
//  Cell.swift
//  Demo
//
//  Created by Suguru Kishimoto on 2015/12/17.

import UIKit
import SUNetworkActivityIndicator

class Cell: UITableViewCell {
  
  @IBOutlet private weak var label: UILabel!
  @IBOutlet private weak var activitySwitch: UISwitch!
  @IBOutlet private(set) weak var indicator: UIActivityIndicatorView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    label.text = ""
    activitySwitch.on = false
    indicator.hidden = true
    indicator.stopAnimating()
    selectionStyle = .None
    // Initialization code
  }
  
  override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }

  
  func configureWithNumber(n: Int) {
    label.text = "connection \(n)"
  }
  
  @objc @IBAction private func switchValueChanged(sender: AnyObject!) {
    if activitySwitch.on {
      start()
    } else {
      end()
    }
  }
  
  func start() {
    NetworkActivityIndicator.shared().start()
    indicator.startAnimating()
    indicator.hidden = false
    activitySwitch.setOn(true,animated: true)
  }
  
  func end() {
    NetworkActivityIndicator.shared().end()
    indicator.hidden = true
    indicator.stopAnimating()
    activitySwitch.setOn(false,animated: true)
  }
  
}
