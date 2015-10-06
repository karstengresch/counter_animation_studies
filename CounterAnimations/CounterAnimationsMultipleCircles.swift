//
//  CounterAnimationsMultipleCircles.swift
//  CounterAnimations
//
//  Created by Karsten Gresch on 03.10.15.
//  Copyright (c) 2015 Closure One. All rights reserved.
//
//  Generated by PaintCode (www.paintcodeapp.com)
//



import UIKit

public class CounterAnimationsMultipleCircles : NSObject {

    //// Drawing Methods

    public class func drawActivity(firstLevel: CGFloat = 0) {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()

        //// Color Declarations
        let move1 = UIColor(red: 0.976, green: 0.000, blue: 0.055, alpha: 1.000)
        let move2 = UIColor(red: 1.000, green: 0.000, blue: 0.674, alpha: 1.000)


        //// Gradient Declarations
        let moveGradient = CGGradientCreateWithColors(CGColorSpaceCreateDeviceRGB(), [move1.CGColor, move2.CGColor], [0, 1])!


        //// Variable Declarations
        let moveDash: CGFloat = firstLevel * 408 + 6


        //// ColorGroup
        //// MaskOval Drawing
        let maskOvalPath = UIBezierPath(ovalInRect: CGRectMake(4, 26, 148, 148))
        CGContextSaveGState(context)
        maskOvalPath.addClip()
        CGContextDrawLinearGradient(context, moveGradient, CGPointMake(78, 26), CGPointMake(78, 174), CGGradientDrawingOptions())
        CGContextRestoreGState(context)

        //// MaskGroup
        CGContextSaveGState(context)
        CGContextTranslateCTM(context, 78, 100)
        CGContextRotateCTM(context, 90 * CGFloat(M_PI) / 180)

        CGContextSetBlendMode(context, .DestinationIn)
        CGContextBeginTransparencyLayer(context, nil)


        //// MoveMask Drawing
        let moveMaskPath = UIBezierPath()
        moveMaskPath.moveToPoint(CGPointMake(-65, 0))
        moveMaskPath.addCurveToPoint(CGPointMake(0, -65), controlPoint1: CGPointMake(-65, -35.9), controlPoint2: CGPointMake(-35.9, -65))
        moveMaskPath.addCurveToPoint(CGPointMake(65, 0), controlPoint1: CGPointMake(35.9, -65), controlPoint2: CGPointMake(65, -35.9))
        moveMaskPath.addCurveToPoint(CGPointMake(-0, 65), controlPoint1: CGPointMake(65, 35.9), controlPoint2: CGPointMake(35.9, 65))
        moveMaskPath.addCurveToPoint(CGPointMake(-65, 0), controlPoint1: CGPointMake(-35.9, 65), controlPoint2: CGPointMake(-65, 35.9))
        moveMaskPath.closePath()
        moveMaskPath.lineCapStyle = .Round;

        UIColor.grayColor().setStroke()
        moveMaskPath.lineWidth = 17
        CGContextSaveGState(context)
        CGContextSetLineDash(context, 1, [moveDash, 408], 2)
        moveMaskPath.stroke()
        CGContextRestoreGState(context)

        CGContextEndTransparencyLayer(context)

        CGContextRestoreGState(context)
    }

    public class func drawActivityComposition(firstLevel: CGFloat = 0) {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()

        //// Color Declarations
        let move1 = UIColor(red: 0.976, green: 0.000, blue: 0.055, alpha: 1.000)
        var move1HueComponent: CGFloat = 1,
            move1SaturationComponent: CGFloat = 1,
            move1BrightnessComponent: CGFloat = 1
        move1.getHue(&move1HueComponent, saturation: &move1SaturationComponent, brightness: &move1BrightnessComponent, alpha: nil)

        let moveBkg = UIColor(hue: move1HueComponent, saturation: move1SaturationComponent, brightness: 0.196, alpha: CGColorGetAlpha(move1.CGColor))
        let exercise1 = UIColor(red: 0.513, green: 0.927, blue: 0.000, alpha: 1.000)
        var exercise1HueComponent: CGFloat = 1,
            exercise1SaturationComponent: CGFloat = 1,
            exercise1BrightnessComponent: CGFloat = 1
        exercise1.getHue(&exercise1HueComponent, saturation: &exercise1SaturationComponent, brightness: &exercise1BrightnessComponent, alpha: nil)


        //// Shadow Declarations
        let shadow = NSShadow()
        shadow.shadowColor = UIColor.darkGrayColor()
        shadow.shadowOffset = CGSizeMake(0.1, -0.1)
        shadow.shadowBlurRadius = 1

        //// ColorGroup
        //// MaskOval Drawing
        let maskOvalPath = UIBezierPath(ovalInRect: CGRectMake(4, 26, 148, 148))
        moveBkg.setFill()
        maskOvalPath.fill()


        //// SymbolGroup
        CGContextSaveGState(context)
        CGContextSetBlendMode(context, .SourceAtop)
        CGContextBeginTransparencyLayer(context, nil)

        //// Symbol Drawing
        let symbolRect = CGRectMake(0, 0, 156, 195)
        CGContextSaveGState(context)
        UIRectClip(symbolRect)
        CGContextTranslateCTM(context, symbolRect.origin.x, symbolRect.origin.y)

        CounterAnimationsMultipleCircles.drawActivity(firstLevel)
        CGContextRestoreGState(context)

        CGContextEndTransparencyLayer(context)
        CGContextRestoreGState(context)

        //// Oval Drawing
        let ovalPath = UIBezierPath(ovalInRect: CGRectMake(57.5, 79.5, 41, 41))
        UIColor.grayColor().setFill()
        ovalPath.fill()

        //// Text Drawing
        let textRect = CGRectMake(6, 25.5, 58, 19)
        let textTextContent = NSString(string: "WTH")
        CGContextSaveGState(context)
        CGContextSetShadowWithColor(context, shadow.shadowOffset, shadow.shadowBlurRadius, (shadow.shadowColor as! UIColor).CGColor)
        let textStyle = NSParagraphStyle.defaultParagraphStyle().mutableCopy() as! NSMutableParagraphStyle
        textStyle.alignment = .Right

        let textFontAttributes = [NSFontAttributeName: UIFont(name: "HelveticaNeue", size: 13)!, NSForegroundColorAttributeName: move1, NSParagraphStyleAttributeName: textStyle]

        let textTextHeight: CGFloat = textTextContent.boundingRectWithSize(CGSizeMake(textRect.width, CGFloat.infinity), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: textFontAttributes, context: nil).size.height
        CGContextSaveGState(context)
        CGContextClipToRect(context, textRect);
        textTextContent.drawInRect(CGRectMake(textRect.minX, textRect.minY + (textRect.height - textTextHeight) / 2, textRect.width, textTextHeight), withAttributes: textFontAttributes)
  
        CGContextRestoreGState(context)
    }

}
