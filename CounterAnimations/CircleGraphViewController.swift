//
//  CircleGraphViewController.swift
//  CounterAnimations
//
//  Created by Karsten Gresch on 05.10.15.
//  Copyright © 2015 Closure One. All rights reserved.
//

import UIKit

class CircleGraphViewController: UIViewController {

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
    print("Sender value: \(sender.value)")
    print("End arc value: \(circleGraphView?.endArc)")
    circleGraphView?.endArc = CGFloat(sender.value)
    percentLabel?.text = String(format: " %5.2f %%", sender.value * 100)
    
  }

}
