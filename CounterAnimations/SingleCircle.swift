//
//  SingleCircle.swift
//  CounterAnimations
//
//  Created by Karsten Gresch on 03.10.15.
//  Copyright © 2015 Closure One. All rights reserved.
//

import UIKit



@IBDesignable
class SingleCircle: UIView {

  var arc: CGFloat = 0.0 { // up to 1.0
    didSet {
      print("End arc set. Value: \(arc)")
      setNeedsDisplay()
    }
  }
  
  override func drawRect(rect: CGRect) {
    CounterAnimationsMultipleCircles.drawActivityComposition(arc)
  }
  

}
