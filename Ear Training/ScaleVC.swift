//
//  ScaleVC.swift
//  Ear Training
//
//  Created by 王富生 on 2017/1/10.
//  Copyright © 2017年 王富生. All rights reserved.
//

import UIKit

class ScaleVC: BaseViewController, SettingDelegate {
    
    @IBOutlet weak var referenceBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        allQuestion = ["Ionian", "Dorian", "Phrygian", "Lydian", "Mixolydian", "Aeolian", "Locrian"]
        range = Status.status.scaleRange
        compass = nil
        
        answersCount = Status.status.scaleAnswerTimes
        rightAnswer = Status.status.scaleRightTimes
        answerTimes.text = String("\(rightAnswer)/\(answersCount)")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        Status.status.scaleRange = range
        Status.status.scaleAnswerTimes = answersCount
        Status.status.scaleRightTimes = rightAnswer
    }

    
    @IBAction func backButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! ScaleSettingVC
        destination.delegate = self
    }
    
    @IBOutlet weak var ionian: AnswerButton!
    @IBOutlet weak var dorian: AnswerButton!
    @IBOutlet weak var phrygian: AnswerButton!
    @IBOutlet weak var lydian: AnswerButton!
    @IBOutlet weak var mixolydian: AnswerButton!
    @IBOutlet weak var aeolian: AnswerButton!
    @IBOutlet weak var locrian: AnswerButton!
    
    
    
    @IBOutlet weak var answerTimes: UILabel!
    
    @IBAction func playQuestion() {
        play()
    }
    
    @IBAction func answerChoose(_ sender: UIButton) {
        answer(sender)
        answerTimes.text = String("\(rightAnswer)/\(answersCount)")
    }
    
    @IBAction func reset(_ sender: UIButton) {
        answersCount = 0
        rightAnswer = 0
        answerTimes.text = String("0/0")
        refreshUI(by: range)
    }
    
    override func play() {
        audio.play(question: question, folder: .scale)
    }
    
    override func refreshUI(by range: Set<String>) {
        ionian.setButton(by: range)
        dorian.setButton(by: range)
        phrygian.setButton(by: range)
        lydian.setButton(by: range)
        mixolydian.setButton(by: range)
        aeolian.setButton(by: range)
        locrian.setButton(by: range)
    }
    
    override func lockAllBtn() {
        ionian.isEnabled = false
        dorian.isEnabled = false
        phrygian.isEnabled = false
        lydian.isEnabled = false
        mixolydian.isEnabled = false
        aeolian.isEnabled = false
        locrian.isEnabled = false
    }
}


