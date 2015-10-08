//
//  StopwatchHand.swift
//  PaintCode
//
//  Created by Karsten Gresch on 02.10.15.
//

import UIKit

@IBDesignable
class StopwatchHand: UIView {
  
  
  
  var rotation: CGFloat = 0.0 { // up to 1.0
    didSet {
      print("End rotation set. Value: \(rotation)")
      setNeedsDisplay()
    }
  }
  
  
  override func drawRect(rect: CGRect) {
    StopWatchPaintCode.drawStopwatchHand(number: rotation)
  }
}
