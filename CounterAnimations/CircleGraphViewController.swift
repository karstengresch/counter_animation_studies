//
//  CircleGraphViewController.swift
//  CounterAnimations
//
//  Created by Karsten Gresch on 05.10.15.
//  Copyright © 2015 Closure One. All rights reserved.
//

import UIKit

class CircleGraphViewController: UIViewController {
  
  var lastInterval = NSTimeInterval()
  var timer = NSTimer()
  var totalTime = NSTimeInterval()
  let maxTime: Double = 12.0

  @IBOutlet weak var percentLabel: UILabel?

  @IBOutlet weak var circleGraphView: CircleGraphView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
  
  @IBAction func slider(sender: UISlider) {
    // print("Sender value: \(sender.value)")
    // print("End arc value: \(circleGraphView?.endArc)")
    circleGraphView?.endArc = CGFloat(sender.value)
    percentLabel?.text = String(format: " %5.2f %%", sender.value * 100)
    
  }
  @IBAction func startButtonPressed(sender: AnyObject) {
    // print("Start button pressed")
    
    circleGraphView?.endArc = 0
    
    if !timer.valid {
      let selector: Selector = "updateCounter"
      timer = NSTimer.scheduledTimerWithTimeInterval(0.01,
        target: self,
        selector: selector,
        userInfo: nil,
        repeats: true)
      lastInterval = NSDate.timeIntervalSinceReferenceDate()
    } else {
      circleGraphView?.endArc = 1.0
      timer.invalidate()
    }
  }
  
  func updateCounter() {
    
    let now = NSDate.timeIntervalSinceReferenceDate()
    totalTime += now - lastInterval
    lastInterval = now
    
    if(totalTime < maxTime) {
      circleGraphView?.endArc = CGFloat(totalTime / maxTime)
      percentLabel?.text = String(format: " %5.2f %%", totalTime / maxTime * 100)
    }
    else {
      circleGraphView?.endArc = 1.0
      totalTime = 0
      timer.invalidate()
    }
    
  }

}
