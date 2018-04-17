//
//  Delegate.swift
//  Ear Training
//
//  Created by 王富生 on 2017/2/20.
//  Copyright © 2017年 王富生. All rights reserved.
//

class Reference {
    static let shared = Reference()
    var delegate: sendPickViewRow?
    var reference = 0 {
        didSet {
            delegate?.reference(reference)
        }
    }
}

protocol sendPickViewRow {
    func reference<T>(_  t: T)
}
