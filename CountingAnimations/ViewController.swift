//
//  ViewController.swift
//  CountingAnimations
//
//  Created by admin on 16.12.2020.
//

import UIKit

class ViewController: UIViewController {
  
  var displayLink: CADisplayLink!
  
  let countingLabel: UILabel = {
    let label = UILabel()
    label.text = "1234"
    label.textAlignment = .center
    label.font = UIFont.boldSystemFont(ofSize: 18)
    return label
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.addSubview(countingLabel)
    countingLabel.frame = self.view.frame
    
    displayLink = CADisplayLink(target: self, selector: #selector(handleUpdate))
    displayLink.add(to: .main, forMode: .default)
  }
  
  var starttValue: Double = 0
  let endValue: Double = 1000
  let animationDuration: Double = 1.5
  
  let animationStartDate = Date()
  
  @objc
  func handleUpdate() {
    let now = Date()
    let elapsedTime = now.timeIntervalSince(animationStartDate)
    if elapsedTime > animationDuration {
      self.countingLabel.text = String(format: "%.f", endValue)
      displayLink.invalidate()
    } else {
      let persentage = elapsedTime / animationDuration
      let value = starttValue + persentage * (endValue - starttValue)
      self.countingLabel.text = String(format: "%.3f", value)
    }
  }
}

