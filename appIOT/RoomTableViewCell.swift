//
//  RoomTableViewCell.swift
//  appIOT
//
//  Created by Ngoduc on 6/3/20.
//  Copyright © 2020 Ngoduc. All rights reserved.
//

import UIKit

class RoomTableViewCell: UITableViewCell {

    @IBOutlet weak var device: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var background: UIImageView!
    
    @IBOutlet weak var backView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func draw(_ rect: CGRect) {

    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
