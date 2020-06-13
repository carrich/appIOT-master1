//
//  RoomCollectionViewCell.swift
//  appIOT
//
//  Created by Ngoduc on 6/3/20.
//  Copyright © 2020 Ngoduc. All rights reserved.
//

import UIKit
protocol CollectionNew {
    func onClick(index: Int)
}
class RoomCollectionViewCell: UICollectionViewCell {
    
   
    @IBOutlet weak var airConditionerView: UIView!
     
   
    @IBOutlet weak var icon1: UIImageView!
    

  
    @IBOutlet weak var switchControl: BigSwitch!
    
    @IBOutlet weak var devide: UILabel!
    
    @IBOutlet weak var state: UILabel!
    var cellDelegate: CollectionNew?
    var index: IndexPath?
    var roomDetail: RoomM! {
        didSet{
            icon1.image = UIImage(named: roomDetail.icon1)
            switchControl.isOn = roomDetail.icon2
                   devide.text = roomDetail.divice
                   state.text = roomDetail.temp
        }
       
    }
    @IBAction func switchOff(_ sender: UISwitch) {
        cellDelegate?.onClick(index: index!.row)
    }
}
