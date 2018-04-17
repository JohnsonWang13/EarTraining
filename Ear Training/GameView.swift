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
//        self.backgroundColor = UIColor.black
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
       
    }
    
    lazy var imageView: UIImageView = {
        let image = UIImageView.init(frame: CGRect(x:0, y:0, width: self.bounds.width, height: self.bounds.width))
        image.layer.cornerRadius = 10.0
        image.backgroundColor = UIColor.black
        image.clipsToBounds = true
        
        return image
    }()
    
    lazy var titleImage: UIImageView = {
        let titleImage = UIImageView.init(frame: CGRect(x:0 - self.bounds.width * 0.25, y:self.bounds.height * (23.8 / 46.7 + 1), width: self.bounds.width * 63.3 / 46.7, height: self.bounds.height * 20 / 46.7))
        
        return titleImage
    }()
    
    
    override func layoutSubviews() {
        addSubview(titleImage)
        addSubview(imageView)
        
    }
}
