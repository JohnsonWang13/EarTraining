//
//  scaleButton.swift
//  Ear Training
//
//  Created by 王富生 on 2017/1/24.
//  Copyright © 2017年 王富生. All rights reserved.
//

import UIKit

class AnswerButton: UIButton {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.layer.cornerRadius = 10.0
        self.tintColor = UIColor.btnBrown
        self.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0)
        self.isOpaque = true
        self.titleLabel?.font = UIFont(name: "Optima-Bold", size: 14)
    }
}

extension UIButton {
    
    func setButton(by setting: Set<String>){
        if setting.contains((self.titleLabel?.text)!) {
            self.isEnabled = true
            self.setTitleColor(UIColor.btnBrown, for: .normal)
        } else {
            self.isEnabled = false
            self.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0), for: .normal)
        }
    }
    
    func rightAnswer() {
        self.setTitleColor(.btnGreen, for: .normal)
    }
    
    func wrongAnswer() {
        self.setTitleColor(.btnRed, for: .normal)
        self.isEnabled = false
    }
}

class QuestionButton: UIButton {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.layer.cornerRadius = 10.0
        self.titleLabel?.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.titleLabel?.layer.shadowColor = UIColor.black.cgColor
        self.titleLabel?.layer.shadowOpacity = 0.3
        self.titleLabel?.layer.shadowRadius = 4
        self.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0)
        self.titleLabel?.font = UIFont(name: "Optima", size: 38)
        self.tintColor = UIColor.questionBtnTitle
    }
}

class StratTrainBtn: UIButton {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.layer.cornerRadius = 4.0
        self.tintColor = UIColor.FuBlack
        self.backgroundColor = UIColor.startBtnBackground
        self.titleLabel?.font = UIFont(name: "Apple Chancery", size: 18)
    }
}

