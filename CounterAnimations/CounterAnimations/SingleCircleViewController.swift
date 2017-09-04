//
//  SingleCircleViewController.swift
//  CounterAnimations
//
//  Created by Karsten Gresch on 03.10.15.
//  Copyright © 2015 Closure One. All rights reserved.
//

import UIKit

class SingleCircleViewController: UIViewController {
  
  @IBOutlet weak var singleCircle: SingleCircle?
  
  var lastInterval = NSTimeInterval()
  var timer = NSTimer()
  var totalTime = NSTimeInterval()
  let maxTime: Double = 12.0
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  
  @IBAction func sliderChanged(sender: UISlider) {
    singleCircle?.arc = CGFloat(sender.value)
  }
  
  @IBAction func startButtonPressed(sender: AnyObject) {
    print("Start button pressed")
    
    singleCircle?.arc = 0
    
    if !timer.valid {
      let selector: Selector = "updateCounter"
      timer = NSTimer.scheduledTimerWithTimeInterval(0.01,
        target: self,
        selector: selector,
        userInfo: nil,
        repeats: true)
      lastInterval = NSDate.timeIntervalSinceReferenceDate()
    } else {
      singleCircle?.arc = 1.0
      timer.invalidate()
    }
  }
  
  func updateCounter() {
    
    let now = NSDate.timeIntervalSinceReferenceDate()
    totalTime += now - lastInterval
    lastInterval = now
    
    if(totalTime < maxTime) {
      singleCircle?.arc = CGFloat(totalTime / maxTime)
    }
    else {
      singleCircle?.arc = 1.0
      totalTime = 0
      timer.invalidate()
    }
    
  }
  
  
  
  
}
