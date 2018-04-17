//
//  TableViewCell.swift
//  Ear Training
//
//  Created by 王富生 on 2017/2/20.
//  Copyright © 2017年 王富生. All rights reserved.
//

import UIKit

protocol ReferenceDelegate {
    var reference: Int { get set }
}

class ReferenceCell: UITableViewCell {
    
    let allNote = ["C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"]
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    var delegate: ReferenceDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = UIColor.settingBackgroundColor
        
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
    }
}

extension ReferenceCell: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return allNote.count
    }
    
}

extension ReferenceCell: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let data = allNote[row]
        let title = NSAttributedString(string: data, attributes: [NSForegroundColorAttributeName:UIColor.tableViewTintColor])
        return title
    }
    
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//
//        return allNote[row]
//    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        delegate?.reference = row
        Reference.shared.reference = row
    }
}
