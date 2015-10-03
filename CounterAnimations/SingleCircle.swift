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
  override func drawRect(rect: CGRect) {
    CounterAnimationsMultipleCircles.drawActivity(CGFloat(0.0))
  }
  

}
