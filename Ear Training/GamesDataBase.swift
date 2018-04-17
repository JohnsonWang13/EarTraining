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
        gameData.append(GamesData.init(name: "Note", image: UIImage(named: "Note")!, titleImage: UIImage(named: "Letter_Notes")!, discription: "somthing1"))
        gameData.append(GamesData.init(name: "Interval", image: UIImage(named: "Interval")!, titleImage: UIImage(named: "Letter_Interval")!, discription: "somthing2"))
//        gameData.append(GamesData.init(name: "Scale", image: UIImage(named: "Scale")!, titleImage: UIImage(named: "Letter_Scale"), discription: "somthing3"))
        gameData.append(GamesData.init(name: "Chord", image: UIImage(named: "Chord")!, titleImage: UIImage(named: "Letter_Chord")!, discription: "somthing4"))
    }
}
