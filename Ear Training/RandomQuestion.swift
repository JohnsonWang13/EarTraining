//
//  ramdomSound.swift
//  Ear Training
//
//  Created by 王富生 on 2017/1/24.
//  Copyright © 2017年 王富生. All rights reserved.
//

import Foundation


class Question {
    
    func change(by random: [String] ,inRange range: Set<String>,random compass: [String]?, completion: (String, String) -> Void) {
        
        var question = ""
        var answer = ""
        
        while true {
            let randomNumber = arc4random_uniform(UInt32(random.count))
            if range.contains(random[Int(randomNumber)]) {
                answer = random[Int(randomNumber)]
                question = answer
                
                if let compass = compass {
                    question.append(compass[Int(arc4random_uniform(UInt32(compass.count)))])
                }
                
                completion(question, answer)
                return
            }
        }
    }
}
