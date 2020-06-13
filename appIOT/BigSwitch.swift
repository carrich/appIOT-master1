//
//  BigSwitch.swift
//  appIOT
//
//  Created by Ngoduc on 6/9/20.
//  Copyright © 2020 Ngoduc. All rights reserved.
//

import UIKit
@IBDesignable
class BigSwitch: UISwitch {

   @IBInspectable var scale : CGFloat = 1{
       didSet{
           setup()
       }
   }

   //from storyboard
   required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
       setup()
   }
   //from code
   override init(frame: CGRect) {
       super.init(frame: frame)
       setup()
   }

   private func setup(){
       self.transform = CGAffineTransform(scaleX: scale, y: scale)
   }

   override func prepareForInterfaceBuilder() {
       setup()
       super.prepareForInterfaceBuilder()
   }

}
