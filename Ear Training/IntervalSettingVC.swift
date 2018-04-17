//
//  SettingVC.swift
//  Ear Training
//
//  Created by 王富生 on 2017/1/24.
//  Copyright © 2017年 王富生. All rights reserved.
//

import UIKit

class IntervalSettingVC: BaseSettingVC {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        allQuestion = ["Unison", "Minor 2nd", "Major 2nd", "Minor 3rd", "Major 3rd", "Perfect 4th", "Tritone", "Perfect 5th", "Minor 6th", "Major 6th", "Minor 7th", "Major 7th", "Octave"]
        
        tableView.dataSource = self
        tableView.delegate = self
    }

    @IBAction func quit(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
















