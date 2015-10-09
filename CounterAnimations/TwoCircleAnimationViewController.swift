//
//  TwoCircleAnimationViewController.swift
//  CounterAnimations
//
//  Created by Karsten Gresch on 09.10.15.
//  Copyright © 2015 Closure One. All rights reserved.
//

import UIKit

class TwoCircleAnimationViewController: UIViewController {

  @IBOutlet weak var twoCircleAnimationView: TwoCircleAnimationView?
  
    override func viewDidLoad() {
        super.viewDidLoad()
        twoCircleAnimationView?.setupLayers()
        twoCircleAnimationView?.setupProperties()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  @IBAction func startTwoCircleAnimation(sender: UIButton) {
       twoCircleAnimationView?.addRotateSmallOvalAnimation()
  }
 
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
