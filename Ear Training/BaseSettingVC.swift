//
//  ChordSettingVC.swift
//  Ear Training
//
//  Created by 王富生 on 2017/1/24.
//  Copyright © 2017年 王富生. All rights reserved.
//

import UIKit

class BaseSettingVC: UIViewController {

    override func viewDidLoad() {

        self.view.backgroundColor = UIColor.settingBackgroundColor
    }

    var allQuestion = [String]()

    var delegate: SettingDelegate?

    func alert() {
        let alert = UIAlertController(title: "注意!", message: "請選擇兩個以上", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}


//---------------------------------------TableView

extension BaseSettingVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allQuestion.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.selectionStyle = .none
        cell.textLabel?.text = allQuestion[indexPath.row]
        
        if (delegate?.range.contains(allQuestion[indexPath.row]))! {
            tableView.selectRow(at: indexPath, animated: true, scrollPosition: .none)
            cell.accessoryType = .checkmark
            cell.tintColor = UIColor.tableViewTintColor
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }
}

extension BaseSettingVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! SettingTableViewCell
        cell.accessoryType = .checkmark
        
        delegate?.range.insert(allQuestion[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        if (delegate?.range.count)! > 2 {
            
            let cell = tableView.cellForRow(at: indexPath) as! SettingTableViewCell
            cell.accessoryType = .none
            
            let _ = delegate?.range.remove(allQuestion[indexPath.row])
        } else {
            tableView.selectRow(at: indexPath, animated: true, scrollPosition: .none)
            alert()
        }
    }
}

class SettingTableView: UITableView {
    
    override func awakeFromNib() {
        self.backgroundColor = UIColor.settingBackgroundColor
        self.tintColor = UIColor.tableViewTintColor
    }
}

class SettingTableViewCell: UITableViewCell {
    
    override func awakeFromNib() {
        self.backgroundColor = UIColor.settingBackgroundColor
        self.tintColor = UIColor.tableViewTintColor
        self.textLabel?.textColor = UIColor.tableViewTintColor
    }
}

