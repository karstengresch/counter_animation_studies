//
//  StopWatch.swift
//  PaintCodeTutorial
//
//  Created by Karsten Gresch on 08.10.15.
//  Copyright (c) 2015 Closure One. All rights reserved.
//
//  Generated by PaintCode (www.paintcodeapp.com)
//



import UIKit

public class StopWatchPaintCode : NSObject {

    //// Cache

    private struct Cache {
        static let color: UIColor = UIColor(red: 0.481, green: 0.631, blue: 0.860, alpha: 1.000)
        static var imageOfStopwatch: UIImage?
        static var stopwatchTargets: [AnyObject]?
    }

    //// Colors

    public class var color: UIColor { return Cache.color }

    //// Drawing Methods

    public class func drawStopwatch() {

        //// Oval Drawing
        // TODO Should be created dynamically based on superview or constraints
        let ovalPath = UIBezierPath(ovalInRect: CGRectMake(15, 30, 220, 220))
        StopWatchPaintCode.color.setFill()
        ovalPath.fill()
    }

    public class func drawStopwatchHand(number number: CGFloat = 1) {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()

        //// Bezier 2 Drawing
        CGContextSaveGState(context)
        CGContextTranslateCTM(context, 125, 110)
        CGContextRotateCTM(context, -number * CGFloat(M_PI) / 180)

        let bezier2Path = UIBezierPath()
        bezier2Path.moveToPoint(CGPointMake(4, -84))
        bezier2Path.addCurveToPoint(CGPointMake(4, -14.46), controlPoint1: CGPointMake(4, -84), controlPoint2: CGPointMake(4, -46.6))
        bezier2Path.addCurveToPoint(CGPointMake(15, 0), controlPoint1: CGPointMake(10.34, -12.71), controlPoint2: CGPointMake(15, -6.9))
        bezier2Path.addCurveToPoint(CGPointMake(4, 14.46), controlPoint1: CGPointMake(15, 6.9), controlPoint2: CGPointMake(10.34, 12.71))
        bezier2Path.addCurveToPoint(CGPointMake(4, 31), controlPoint1: CGPointMake(4, 24.44), controlPoint2: CGPointMake(4, 31))
        bezier2Path.addLineToPoint(CGPointMake(-4, 31))
        bezier2Path.addCurveToPoint(CGPointMake(-4, 14.46), controlPoint1: CGPointMake(-4, 31), controlPoint2: CGPointMake(-4, 24.44))
        bezier2Path.addCurveToPoint(CGPointMake(-15, 0), controlPoint1: CGPointMake(-10.34, 12.71), controlPoint2: CGPointMake(-15, 6.9))
        bezier2Path.addCurveToPoint(CGPointMake(-4, -14.46), controlPoint1: CGPointMake(-15, -6.9), controlPoint2: CGPointMake(-10.34, -12.71))
        bezier2Path.addCurveToPoint(CGPointMake(-4, -84), controlPoint1: CGPointMake(-4, -46.6), controlPoint2: CGPointMake(-4, -84))
        bezier2Path.addLineToPoint(CGPointMake(4, -84))
        bezier2Path.addLineToPoint(CGPointMake(4, -84))
        bezier2Path.closePath()
        UIColor.whiteColor().setFill()
        bezier2Path.fill()

        CGContextRestoreGState(context)
    }

    //// Generated Images

    public class var imageOfStopwatch: UIImage {
        if Cache.imageOfStopwatch != nil {
            return Cache.imageOfStopwatch!
        }

        UIGraphicsBeginImageContextWithOptions(CGSizeMake(250, 250), false, 0)
            StopWatchPaintCode.drawStopwatch()

        Cache.imageOfStopwatch = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return Cache.imageOfStopwatch!
    }

    //// Customization Infrastructure

    @IBOutlet var stopwatchTargets: [AnyObject]! {
        get { return Cache.stopwatchTargets }
        set {
            Cache.stopwatchTargets = newValue
            for target: AnyObject in newValue {
                target.performSelector("setImage:", withObject: StopWatchPaintCode.imageOfStopwatch)
            }
        }
    }

}
