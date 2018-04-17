//
//  BaseViewController.swift
//  Ear Training
//
//  Created by 王富生 on 2017/2/23.
//  Copyright © 2017年 王富生. All rights reserved.
//

import UIKit


protocol SettingDelegate {
    var range: Set<String> { get set }
}


class BaseViewController: UIViewController {

    var allQuestion = [String]()
    var range = Set<String>() {
        didSet {
            changeQuestion(allQuestion, inRange: range, random: compass)
        }
    }
    var compass: [String]?
    var answerRate = 0
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.backgroundGray
    }
    
    override func viewWillAppear(_ animated: Bool) {
        changeQuestion(allQuestion, inRange: range, random: compass)
        refreshUI(by: range)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.0 ) {
            self.play()
        }
    }
    
    let audio = Audio()
    
    var answersCount = 0
    var rightAnswer = 0
    var question: String!
    var answer: String!
    
    func answer(_ sender: UIButton) {
        if question.contains((sender.titleLabel?.text)!) {
            
            rightAnswer += 1
            sender.rightAnswer()
            lockAllBtn()
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5 ) {
                self.refreshUI(by: self.range)
                self.changeQuestion(self.allQuestion, inRange: self.range, random: self.compass)
                self.play()
            }
        } else {
            sender.wrongAnswer()
        }
        answersCount += 1
        answerRate = Int(Double(rightAnswer)/Double(answersCount) * 100)
    }
    
    func changeQuestion(_ all: [String], inRange range: Set<String>, random compass: [String]?) {
        Question().change(by: all, inRange: range, random: compass) {
            question, answer in
            self.question = question
            self.answer = answer
        }
    }

    func resetCount() {
        answersCount = 0
        rightAnswer = 0
    }
    
    func play() {
        audio.play(question: question, folder: .notes)
    }
    
    func refreshUI(by range: Set<String>) {
        
    }
    
    func lockAllBtn() {

    }
}


class Status {
    
    static let status = Status()
    
    var noteReference = 0
    var notesRange: Set<String> = ["C", "D", "E", "F", "G", "A", "B"]
    var intervalRange: Set<String> = ["Unison", "Minor 2nd", "Major 2nd", "Minor 3rd", "Major 3rd", "Perfect 4th", "Tritone", "Perfect 5th", "Minor 6th", "Major 6th", "Minor 7th", "Major 7th", "Octave"]
    var scaleRange: Set<String> = ["Ionian", "Dorian", "Phrygian", "Lydian", "Mixolydian", "Aeolian", "Locrian"]
    var chordRange: Set<String> = ["Major 3rd", "Minor 3rd", "Major 7th", "Minor 7th"]
    
    var noteAnswerTimes = 0
    var noteRightTimes = 0
    var intervalAnswerTimes = 0
    var intervalRightTimes = 0
    var scaleAnswerTimes = 0
    var scaleRightTimes = 0
    var chordAnswerTimes = 0
    var chordRightTimes = 0
}
