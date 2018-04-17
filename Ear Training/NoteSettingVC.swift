//
//  SettingVC.swift
//  Ear Training
//
//  Created by 王富生 on 2017/1/24.
//  Copyright © 2017年 王富生. All rights reserved.
//

import UIKit

protocol NoteSettingDelegate {
    var range: Set<String> { get set }
    var reference: Int { get }
}

class NoteSettingVC: UIViewController {
    
    let allNote = [["C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"],[""]]
    let tableViewTitle = ["Notes", "Reference"]
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var tableViewLayout: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 200
        
    }
    
    var delegate: NoteSettingDelegate?
    
    func alert() {
        let alert = UIAlertController(title: "注意!", message: "請選擇兩個以上的音", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    @IBAction func quit(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}

//---------------------------------------TableView

extension NoteSettingVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return tableViewTitle[section]
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allNote[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            
            cell.selectionStyle = .none
            cell.textLabel?.text = allNote[0][indexPath.row]
            cell.textLabel?.textColor = UIColor.tableViewTintColor
            
            
            if (delegate?.range.contains(allNote[0][indexPath.row]))! {
                tableView.selectRow(at: indexPath, animated: true, scrollPosition: .none)
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
            }
            
            return cell
        } else {
            
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! ReferenceCell

            cell2.pickerView.selectRow((delegate?.reference)!, inComponent: 0, animated: true)
            
            return cell2
        }
    }
}


extension NoteSettingVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = self.tableView.cellForRow(at: indexPath)
        cell?.accessoryType = .checkmark
        delegate?.range.insert(allNote[indexPath.section][indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        if (delegate?.range.count)! > 2 {
            
            let cell = self.tableView.cellForRow(at: indexPath)
            cell?.accessoryType = .none
            
            let _ = delegate?.range.remove(allNote[indexPath.section][indexPath.row])
        } else {
            tableView.selectRow(at: indexPath, animated: true, scrollPosition: .none)
            alert()
        }
    }
}


















