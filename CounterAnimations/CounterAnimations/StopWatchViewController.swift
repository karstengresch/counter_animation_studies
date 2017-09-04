//
//  StopWatchViewController.swift
//  CounterAnimations
//
//  Created by Karsten Gresch on 08.10.15.
//  Copyright © 2015 Closure One. All rights reserved.
//

import UIKit

class StopWatchViewController: UIViewController {

  
  @IBOutlet weak var stopwatchHand: StopwatchHand?
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    
  }
  
  @IBAction func stopwatchSliderChanged(sender: UISlider) {
    print("Stopwatch Sender value: \(sender.value)")
    stopwatchHand?.rotation = CGFloat(sender.value * -360)
  }
  
  @IBAction func rotateStopwatchHand(sender: UITapGestureRecognizer) {
    
    
    
  }
  
  

}
