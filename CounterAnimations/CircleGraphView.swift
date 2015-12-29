//
//  CircleGraphView.swift
//  CounterAnimations
//
//  Created by Karsten Gresch on 05.10.15.
//  Derived w/ full Copyright attribution from: 
//  http://makeapppie.com/2015/03/10/swift-swift-basic-core-graphics-for-the-ring-graph/

import UIKit



@IBDesignable
class CircleGraphView: UIView {

  @IBInspectable var endArc: CGFloat = 0.5 { // up to 1.0
    didSet {
      // print("End arc set. Value: \(endArc)")
      setNeedsDisplay()
    }
  }
  // TODO should be based on the surrounding bounds
  @IBInspectable var arcWidth: CGFloat =  10.0
  @IBInspectable var arcColor: UIColor = UIColor(hue:0.113, saturation:0.9598, brightness:0.9717, alpha:1.0)
  @IBInspectable var arcBackgroundColor: UIColor = UIColor(hue:0.4167, saturation:0.036, brightness:0.2124, alpha:1.0)

  
    override func drawRect(rect: CGRect) {

      // circle defs
      let fullCircle = 2.0 * π
      let start: CGFloat = -0.25 * fullCircle
      let end: CGFloat = endArc * fullCircle + start
      // "We need a center point, an angle on the circle to start and an angle on the circle to end."
      let centerPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect))
      var radius: CGFloat = 0.0
      
      if CGRectGetWidth(rect) > CGRectGetHeight(rect) {
        radius = (CGRectGetWidth(rect) - arcWidth) / 2.0
      } else {
        radius = (CGRectGetHeight(rect) - arcWidth) / 2.0
      }
      
      let context = UIGraphicsGetCurrentContext()
      // let colorspace = CGColorSpaceCreateDeviceRGB()
      CGContextSetLineWidth(context, arcWidth)
      CGContextSetLineCap(context, .Round)
      CGContextSetStrokeColorWithColor(context, arcColor.CGColor)
      
      CGContextAddArc(context, centerPoint.x, centerPoint.y, radius, start, end, 0)
      CGContextStrokePath(context)

      
    }
  
  override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
      print("Circle Graph: touches ended")

  }

}
