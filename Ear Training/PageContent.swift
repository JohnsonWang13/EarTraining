//
//  CardContent.swift
//  Ear Training
//
//  Created by 王富生 on 2017/3/3.
//  Copyright © 2017年 王富生. All rights reserved.
//

import UIKit

struct PageContent {
    var name: String
    var image: UIImage
}

class Pages {
    
    var content = [PageContent]()
    private let pages = ["Notes", "Interval", "Chord"]
    private let image = [UIImage(named: "Note")!, UIImage(named: "Interval")!, UIImage(named: "Chord")!]
    init() {
        for i in 0..<pages.count {
        content.append(PageContent(name: pages[i], image: image[i]))
        }
    }
}
