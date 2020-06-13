//
//  ViewController.swift
//  appIOT
//
//  Created by Ngoduc on 6/3/20.
//  Copyright © 2020 Ngoduc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var notification: UIView!
    @IBOutlet weak var RoomTable: UITableView!
    
    @IBOutlet var oval: UIView!
    
    let rooms = [ Room(name: "Living Room", div: "4 Devices", image: "livingroom"),
                  Room(name: "Media Room", div: "6 Devices", image: "mediaRoom2"),
                  Room(name: "Bathroom", div: "4 Devices", image: "badRoom3"),
                  Room(name: "Bedroom", div: "4 Devices", image: "bedRoom2")
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().tintColor = #colorLiteral(red: 0.9803921569, green: 0.3921568627, blue: 0, alpha: 1)
        notification.layer.cornerRadius = 8
        RoomTable.register(UINib(nibName: "RoomTableViewCell", bundle: nil), forCellReuseIdentifier: "RoomTableViewCell")
        RoomTable.separatorStyle = .none
        RoomTable.rowHeight = 150
    }
    
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RoomTableViewCell", for: indexPath) as! RoomTableViewCell
        cell.name.text = rooms[indexPath.row].name
        cell.device.text = rooms[indexPath.row ].div
        cell.background.image = UIImage(named: rooms[indexPath.row].image)
        cell.background.layer.cornerRadius = 12.5
        cell.background.clipsToBounds = true
        cell.backView.layer.shadowColor = UIColor.gray.cgColor
        cell.backView.layer.shadowOffset = CGSize(width: 0, height: 3)
        cell.background.layer.shadowRadius = 3
        cell.backView.layer.shadowOpacity = 1
        cell.backView.layer.cornerRadius = 12.5
        return cell
    }
    
    
}
