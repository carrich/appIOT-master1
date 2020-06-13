//
//  Canvas.swift
//  indecatorC
//
//  Created by Ngoduc on 6/4/20.
//  Copyright © 2020 Ngoduc. All rights reserved.
//

import UIKit

@IBDesignable
class Canvas: UIView {
    var halfFrameWidth: CGFloat = 0
    var fullFrameWidth: CGFloat = 0
    let needleFrameBottom: CGFloat = 10.0
    var needleLength: CGFloat = 0
    var centerView: CGPoint?
    var changeDegree = 180
    var changeValue: Int = 0{
        didSet{
            setNeedsDisplay()
        }
    }
    var showValue: Int = 189{
        didSet{
            setNeedsDisplay()
        }
    }
    var index = 10
    let vien = CAShapeLayer()
    
    
    
    override func draw(_ rect: CGRect) {
        halfFrameWidth = self.bounds.width / 2
        fullFrameWidth = self.bounds.width
        needleLength = halfFrameWidth * 0.5
        centerView = CGPoint(x: halfFrameWidth, y: halfFrameWidth)
        creadNeedle()
        createCompassMark()
        control(changeValue: changeValue)
    }
    
    func creadNeedle(){
        let innerRing = UIBezierPath(arcCenter: centerView!, radius: halfFrameWidth * 0.5, startAngle: 0, endAngle: 2 * .pi, clockwise: true)
        UIColor.lightGray.setStroke()
        innerRing.lineWidth = 20
        innerRing.stroke()
        
        let innerRing2 = UIBezierPath(arcCenter: centerView!, radius: halfFrameWidth * 0.45, startAngle: 0, endAngle: 2 * .pi, clockwise: true)
        UIColor.lightGray.setStroke()
        innerRing2.lineWidth = 2
        innerRing2.stroke()
        
        let outerRing = UIBezierPath(arcCenter: centerView!, radius: halfFrameWidth * 0.98, startAngle: 0, endAngle: 2 * .pi, clockwise: true)
        UIColor.white.setStroke()
        outerRing.lineWidth = 2
        outerRing.stroke()
    }
    func control(changeValue: Int){
        let innerRing1 = UIBezierPath(arcCenter: centerView!, radius: halfFrameWidth * 0.5, startAngle: -1 * CGFloat.pi, endAngle:
            (-1 * .pi + (CGFloat(changeValue) * CGFloat.pi / 180)), clockwise: true)
        UIColor.blue.setStroke()
        innerRing1.lineWidth = 20
        innerRing1.stroke()
    }
    func createCompassMark(){
        for degree in stride(from: 0, to: showValue, by: 9){
            let outerAcrPoint = archLocationPoint(degree: CGFloat(degree), distance: 0.6)
            let markLength = degree % 90
            var innerArcDistance : CGFloat = 0
            if markLength == 0 {
                innerArcDistance = 0.7
            } else {
                innerArcDistance = 0.65
            }
            let innerAcrPoint = archLocationPoint(degree: CGFloat(degree), distance: innerArcDistance)
            let markLine = UIBezierPath()
            markLine.move(to: outerAcrPoint)
            markLine.addLine(to: innerAcrPoint)
            #colorLiteral(red: 0.7450980392, green: 0.768627451, blue: 0.7960784314, alpha: 1).setStroke()
            markLine.lineWidth = 1
            markLine.stroke()
            
        }
//        for degree in stride(from: 279, to: 360, by: 9){
//            let outerAcrPoint = archLocationPoint(degree: CGFloat(degree), distance: 0.6)
//            let markLength = degree % 90
//            var innerArcDistance : CGFloat = 0
//            if markLength == 0 {
//                innerArcDistance = 0.7
//                index += 10
//            } else {
//                innerArcDistance = 0.65
//            }
//            let innerAcrPoint = archLocationPoint(degree: CGFloat(degree), distance: innerArcDistance)
//            let markLine = UIBezierPath()
//            markLine.move(to: outerAcrPoint)
//            markLine.addLine(to: innerAcrPoint)
//            UIColor.white.setStroke()
//            markLine.lineWidth = 1
//            markLine.stroke()
//
//        }
    }
    func showTemp(){
        for degree in stride(from: 189, to: 279, by: 9){
            let outerAcrPoint = archLocationPoint(degree: CGFloat(degree), distance: 0.6)
            let markLength = degree % 90
            var innerArcDistance : CGFloat = 0
            if markLength == 0 {
                innerArcDistance = 0.7
            } else {
                innerArcDistance = 0.65
            }
            let innerAcrPoint = archLocationPoint(degree: CGFloat(degree), distance: innerArcDistance)
            let markLine = UIBezierPath()
            markLine.move(to: outerAcrPoint)
            markLine.addLine(to: innerAcrPoint)
            #colorLiteral(red: 0.7450980392, green: 0.768627451, blue: 0.7960784314, alpha: 1).setStroke()
            markLine.lineWidth = 1
            markLine.stroke()
            
        }
    }
    func archLocationPoint(degree: CGFloat, distance: CGFloat) -> CGPoint{
        var location : CGPoint?
        let radian : CGFloat = degree * .pi / 180
        let arcPath = UIBezierPath(arcCenter: centerView!, radius: halfFrameWidth * distance, startAngle: -1 * CGFloat.pi, endAngle: -1 * CGFloat.pi + radian, clockwise: false)
        location = arcPath.currentPoint
        return location!
    }
    func addDegree(degree: Int, location: CGPoint){
        let textLayer = CATextLayer()
        textLayer.frame = CGRect(x: location.x - 10, y: location.y - 5, width: 20, height: 10)
        textLayer.foregroundColor = UIColor.black.cgColor
        textLayer.fontSize  = CGFloat(10)
        textLayer.font = "Arial" as CFString
        textLayer.string = String(degree) + "°C"
        textLayer.alignmentMode = CATextLayerAlignmentMode.center
        textLayer.contentsScale = UIScreen.main.scale
        self.layer.addSublayer(textLayer)
        textLayer.transform = CATransform3DMakeRotation(CGFloat(degree - 10) * .pi / 180, 0.0, 0.0, 1.0)
    }
}
