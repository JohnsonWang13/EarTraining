//
//  ScaleSettingVC.swift
//  Ear Training
//
//  Created by 王富生 on 2017/1/24.
//  Copyright © 2017年 王富生. All rights reserved.
//

import UIKit

class ScaleSettingVC: BaseSettingVC {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        allQuestion = ["Ionian", "Dorian", "Phrygian", "Lydian", "Mixolydian", "Aeolian", "Locrian"]

        tableView.dataSource = self
        tableView.delegate = self
    }
}


















