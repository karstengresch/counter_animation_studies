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
  @IBAction func sliderChanged(sender: UISlider) {
    singleCircle?.arc = CGFloat(sender.value)
    
    
  }

  @IBAction func startButtonPressed(sender: AnyObject) {
    print("Start button pressed")
 
    let totalTime = 12
    
    for var second = 0; second<=totalTime-1; second++ {
      print("second: \(second)")
      let currentRatio: Float = Float(second/totalTime)
      print("Current Ratio_ \(currentRatio)")
      
      let timer = NSTimer.new(every: 1.seconds)
        {
      
      }
      
      timer.start()
      self.singleCircle?.arc = CGFloat(second/totalTime)

      
        if second == totalTime-1
        {
          timer.invalidate()
          break
      }
      
    }
      

    }
  
}
