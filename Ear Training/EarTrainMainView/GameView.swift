//
//  GameView.swift
//  EarTrainMainView
//
//  Created by 王富生 on 2017/3/17.
//  Copyright © 2017年 王富生. All rights reserved.
//

import UIKit

class GameView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.black
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    lazy var title: UILabel = {
        let title = UILabel.init(frame: CGRect(x: 0, y: 20, width: self.bounds.width, height: 40))
        title.textAlignment = .center
        title.textColor = UIColor.white
        title.font = UIFont(name: "Notes", size: 36)
        
        return title
    }()
    
    lazy var image: UIImageView = {
        let image = UIImageView.init(frame: CGRect(x: self.bounds.width / 2 - 50, y: 50, width: 100, height:80))
        
        return image
    }()
    
    
    override func layoutSubviews() {
        addSubview(title)
        addSubview(image)
        
    }
}
