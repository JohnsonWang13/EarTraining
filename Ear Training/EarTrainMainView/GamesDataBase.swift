//
//  GamesDataBase.swift
//  EarTrainMainView
//
//  Created by 王富生 on 2017/3/17.
//  Copyright © 2017年 王富生. All rights reserved.
//

import UIKit

class GamesDataBase {
    var gameData = [GamesData]()
    
    init() {
        gameData.append(GamesData.init(name: "Notes", image: UIImage(named: "Notes")!, discription: "somthing1"))
        gameData.append(GamesData.init(name: "Interval", image: UIImage(named: "Interval")!, discription: "somthing2"))
        gameData.append(GamesData.init(name: "Scale", image: UIImage(named: "Scale")!, discription: "somthing3"))
        gameData.append(GamesData.init(name: "Chord", image: UIImage(named: "Chord")!, discription: "somthing4"))
    }
}
