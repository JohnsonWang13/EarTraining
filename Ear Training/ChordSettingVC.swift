//
//  ChordSettingVC.swift
//  Ear Training
//
//  Created by 王富生 on 2017/1/24.
//  Copyright © 2017年 王富生. All rights reserved.
//

import UIKit

class ChordSettingVC: BaseSettingVC{
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        allQuestion = ["Major 3rd", "Minor 3rd", "Augmented 3rd", "Diminished 3rd", "Major 7th", "Minor 7th", "Dominant 7th", "Diminished 7th", "Half diminished 7th"]
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    @IBAction func quit(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}

//
////---------------------------------------TableView
//
//extension ChordSettingVC: UITableViewDataSource {
//    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return allChord.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        
//        override let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        
//        cell.selectionStyle = .none
//        cell.textLabel?.text = allChord[indexPath.row]
//        
//        if (delegate?.range.contains(allChord[indexPath.row]))! {
//            tableView.selectRow(at: indexPath, animated: true, scrollPosition: .none)
//            cell.accessoryType = .checkmark
//        } else {
//            cell.accessoryType = .none
//        }
//        
//        return cell
//    }
//}
//
//extension ChordSettingVC: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        
//        let cell = tableView.cellForRow(at: indexPath)
//        cell?.accessoryType = .checkmark
//        
//        delegate?.range.insert(allChord[indexPath.row])
//    }
//    
//    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//        
//        if (delegate?.range.count)! > 2 {
//            
//            let cell = tableView.cellForRow(at: indexPath)
//            cell?.accessoryType = .none
//            
//            let _ = delegate?.range.remove(allChord[indexPath.row])
//        } else {
//            tableView.selectRow(at: indexPath, animated: true, scrollPosition: .none)
//            alert()
//        }
//    }
//}
//

















