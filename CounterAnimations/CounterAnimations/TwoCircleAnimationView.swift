//
//  CustomView.swift
//
//  Code generated using QuartzCode 1.38.4 on 08.10.15.
//  www.quartzcodeapp.com
//

import UIKit

@IBDesignable
class TwoCircleAnimationView: UIView {
  
  var updateLayerValueForCompletedAnimation : Bool = true
  var animationAdded : Bool = false
  var completionBlocks : Dictionary<CAAnimation, (Bool) -> Void> = [:]
  var layers : Dictionary<String, AnyObject> = [:]
  
  var smallCircleColor : UIColor!
  var bigCircleColor : UIColor!
  var borderColor : UIColor!
  
  //MARK: - Life Cycle
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupProperties()
    setupLayers()
  }
  
  required init?(coder aDecoder: NSCoder)
  {
    super.init(coder: aDecoder)
    setupProperties()
    setupLayers()
  }
  
  var rotateSmallOvalAnimProgress: CGFloat = 0{
    didSet{
      if(!self.animationAdded){
        removeAllAnimations()
        addRotateSmallOvalAnimation()
        self.animationAdded = true
        layer.speed = 0
        layer.timeOffset = 0
      }
      else{
        let totalDuration : CGFloat = 12.0
        let offset = rotateSmallOvalAnimProgress * totalDuration
        layer.timeOffset = CFTimeInterval(offset)
      }
    }
  }
  
  func setupProperties(){
    self.smallCircleColor = UIColor(red:0.539, green: 0.922, blue:0.442, alpha:1)
    self.bigCircleColor = UIColor(red:0.886, green: 0.922, blue:0.813, alpha:1)
    self.borderColor = UIColor(red:0.495, green: 0.686, blue:0.444, alpha:0.304)
  }
  
  func setupLayers(){
    let Circle = CAShapeLayer()
    // TODO: Initialize statically or based on constraints
    Circle.frame = CGRectMake(40, 40, 80, 80)
    Circle.path = CirclePath().CGPath;
    self.layer.addSublayer(Circle)
    layers["Circle"] = Circle
    
    let CounterOval = CAShapeLayer()
    
    
    
    CounterOval.frame = CGRectMake(CGRectGetMidX(Circle.frame), CGRectGetMidY(Circle.frame) - 7, 8, 8)
    CounterOval.path = CounterOvalPath().CGPath;
    self.layer.addSublayer(CounterOval)
    layers["CounterOval"] = CounterOval
    
    resetLayerPropertiesForLayerIdentifiers(nil)
  }
  
  func resetLayerPropertiesForLayerIdentifiers(layerIds: [String]!){
    CATransaction.begin()
    CATransaction.setDisableActions(true)
    
    if layerIds == nil || layerIds.contains("Circle"){
      let Circle = layers["Circle"] as! CAShapeLayer
      Circle.fillColor   = self.bigCircleColor.CGColor
      Circle.strokeColor = self.borderColor.CGColor
    }
    if layerIds == nil || layerIds.contains("CounterOval"){
      let CounterOval = layers["CounterOval"] as! CAShapeLayer
      CounterOval.anchorPoint   = CGPointMake(0.5, 5.1)
      CounterOval.opacity       = 0.66
      CounterOval.fillColor     = self.smallCircleColor.CGColor
      CounterOval.strokeColor   = self.borderColor.CGColor
      CounterOval.shadowColor   = UIColor(red:0.451, green: 0.626, blue:0.405, alpha:0.8).CGColor
      CounterOval.shadowOpacity = 0.8
      CounterOval.shadowOffset  = CGSizeMake(4, 4)
      CounterOval.shadowRadius  = 14
    }
    
    CATransaction.commit()
  }
  
  //MARK: - Animation Setup
  
  func addRotateSmallOvalAnimation(){
    addRotateSmallOvalAnimationCompletionBlock(nil)
  }
  
  func addRotateSmallOvalAnimationCompletionBlock(completionBlock: ((finished: Bool) -> Void)?){
    addRotateSmallOvalAnimationTotalDuration(12.01, endTime:1, completionBlock:completionBlock)
  }
  
  func addRotateSmallOvalAnimationTotalDuration(totalDuration: CFTimeInterval, endTime: CFTimeInterval, completionBlock: ((finished: Bool) -> Void)?){
    let endTime = endTime * totalDuration
    
    if completionBlock != nil{
      let completionAnim = CABasicAnimation(keyPath:"completionAnim")
      completionAnim.duration = endTime
      completionAnim.delegate = self
      completionAnim.setValue("rotateSmallOval", forKey:"animId")
      completionAnim.setValue(true, forKey:"needEndAnim")
      layer.addAnimation(completionAnim, forKey:"rotateSmallOval")
      if let anim = layer.animationForKey("rotateSmallOval"){
        completionBlocks[anim] = completionBlock
      }
    }
    
    resetLayerPropertiesForLayerIdentifiers(["CounterOval"])
    
    let fillMode : String = kCAFillModeForwards
    
    ////CounterOval animation
    let CounterOvalTransformAnim      = CAKeyframeAnimation(keyPath:"transform.rotation.z")
    CounterOvalTransformAnim.values   = [0,
      360 * CGFloat(M_PI/180)]
    CounterOvalTransformAnim.keyTimes = [0, 1]
    CounterOvalTransformAnim.duration = totalDuration
    
    let CounterOvalRotateSmallOvalAnim : CAAnimationGroup = TwoCircleAnimationQuartzCodeBase.groupAnimations([CounterOvalTransformAnim], fillMode:fillMode)
    layers["CounterOval"]?.addAnimation(CounterOvalRotateSmallOvalAnim, forKey:"CounterOvalRotateSmallOvalAnim")
  }
  
  //MARK: - Animation Cleanup
  
  override func animationDidStop(anim: CAAnimation, finished flag: Bool){
    if let completionBlock = completionBlocks[anim]{
      completionBlocks.removeValueForKey(anim)
      if (flag && updateLayerValueForCompletedAnimation) || anim.valueForKey("needEndAnim") as! Bool{
        updateLayerValuesForAnimationId(anim.valueForKey("animId") as! String)
        removeAnimationsForAnimationId(anim.valueForKey("animId") as! String)
      }
      completionBlock(flag)
    }
  }
  
  func updateLayerValuesForAnimationId(identifier: String){
    if identifier == "rotateSmallOval"{
      TwoCircleAnimationQuartzCodeBase.updateValueFromPresentationLayerForAnimation((layers["CounterOval"] as! CALayer).animationForKey("CounterOvalRotateSmallOvalAnim"), theLayer:(layers["CounterOval"] as! CALayer))
    }
  }
  
  func removeAnimationsForAnimationId(identifier: String){
    if identifier == "rotateSmallOval"{
      (layers["CounterOval"] as! CALayer).removeAnimationForKey("CounterOvalRotateSmallOvalAnim")
    }
    self.layer.speed = 1
  }
  
  func removeAllAnimations(){
    for layer in layers.values{
      (layer as! CALayer).removeAllAnimations()
    }
    self.layer.speed = 1
  }
  
  //MARK: - Bezier Path
  
  func CirclePath() -> UIBezierPath{
    let CirclePath = UIBezierPath(ovalInRect:CGRectMake(0, 0, 80, 80))
    return CirclePath;
  }
  
  func CounterOvalPath() -> UIBezierPath{
    let CounterOvalPath = UIBezierPath(ovalInRect:CGRectMake(0, 0, 8, 8))
    return CounterOvalPath;
  }
  
  
}
