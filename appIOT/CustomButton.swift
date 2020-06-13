//
//  CustomButton.swift
//  appIOT
//
//  Created by Ngoduc on 6/9/20.
//  Copyright © 2020 Ngoduc. All rights reserved.
//

import UIKit
@IBDesignable
class CustomButton: UIButton {


  
    @IBInspectable var cornerRadius: CGFloat = 0 {
            didSet {
                layer.cornerRadius = cornerRadius
                layer.masksToBounds = cornerRadius > 0
            }
        }
        @IBInspectable var dashWidth: CGFloat = 0
        @IBInspectable var dashColor: UIColor = .clear
        @IBInspectable var dashLength: CGFloat = 0
        @IBInspectable var betweenDashesSpace: CGFloat = 0
        
        var dashBorder: CAShapeLayer?
    override func draw(_ rect: CGRect) {
       
        
        self.setTitleColor(UIColor.white, for: UIControl.State.highlighted)
    }
        override func layoutSubviews() {
            super.layoutSubviews()
            dashBorder?.removeFromSuperlayer()
            let dashBorder = CAShapeLayer()
            dashBorder.lineWidth = dashWidth
            dashBorder.strokeColor = dashColor.cgColor
            dashBorder.lineDashPattern = [dashLength, betweenDashesSpace] as [NSNumber]
            dashBorder.frame = bounds
            dashBorder.fillColor = nil
            if cornerRadius > 0 {
                dashBorder.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
            } else {
                dashBorder.path = UIBezierPath(rect: bounds).cgPath
            }
            layer.addSublayer(dashBorder)
            self.dashBorder = dashBorder
        }

//    override var isHighlighted: Bool{
//        didSet {
//
//            if (isHighlighted) {
//                self.backgroundColor = UIColor.blue
//            }
//            else {
//                self.backgroundColor = UIColor.clear
//            }
//
//        }
//    }
//
        

    
}
    

