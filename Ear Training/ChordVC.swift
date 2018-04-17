//
//  ChordVC.swift
//  Ear Training
//
//  Created by 王富生 on 2017/1/10.
//  Copyright © 2017年 王富生. All rights reserved.
//

import UIKit

class ChordVC: BaseViewController, SettingDelegate {
    
    @IBOutlet weak var referenceBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        allQuestion = ["Major 3rd", "Minor 3rd", "Augmented 3rd", "Diminished 3rd", "Major 7th", "Minor 7th", "Dominant 7th", "Diminished 7th", "Half diminished 7th"]
        range = Status.status.chordRange
        compass =  ["1", "2", "3", "4", "5", "6", "7"]
        
        answersCount = Status.status.chordAnswerTimes
        rightAnswer = Status.status.chordRightTimes
        answerTimes.text = String("\(rightAnswer) of \(answersCount)")
        
        major3rd.angle = 9.5
        augmented3rd.angle = 50
        major7th.angle = 90
        minor7th.angle = 130.5
        diminished7th.angle = 170.5
        
        minor3rd.angle = 15
        diminished3rd.angle = 64.5
        dominant7th.angle = 114.5
        halfDiminished7th.angle = 164.5
        
        conductingView.layer.contents = UIImage(named: "IdleOrigin")?.cgImage
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        Status.status.chordRange = range
        Status.status.chordAnswerTimes = answersCount
        Status.status.chordRightTimes = rightAnswer
    }
    
    @IBAction func backButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! ChordSettingVC
        destination.delegate = self
    }
    
    @IBOutlet weak var major3rd: ChordOuterRing!
    @IBOutlet weak var minor3rd: ChordInnerRing!
    @IBOutlet weak var augmented3rd: ChordOuterRing!
    @IBOutlet weak var diminished3rd: ChordInnerRing!
    @IBOutlet weak var major7th: ChordOuterRing!
    @IBOutlet weak var minor7th: ChordOuterRing!
    @IBOutlet weak var dominant7th: ChordInnerRing!
    @IBOutlet weak var diminished7th: ChordOuterRing!
    @IBOutlet weak var halfDiminished7th: ChordInnerRing!
    
    
    @IBOutlet weak var answerTimes: UILabel!
    @IBOutlet weak var answerRateLabel: UILabel!
    
    @IBOutlet weak var conductingView: UIView!
    
    @IBAction func playQuestion() {
        
        play()
        
        let conductingAnimate = CABasicAnimation(keyPath: "contents")
        conductingAnimate.fromValue = UIImage(named: "IdleOrigin")?.cgImage
        conductingAnimate.toValue = UIImage(named: "IdleWave")?.cgImage
        conductingAnimate.duration = 0.6
        conductingAnimate.fillMode = kCAFillModeRemoved
        conductingAnimate.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionDefault)
        conductingView.layer.add(conductingAnimate, forKey: nil)
    }
    
    @IBAction func answerButton(_ sender: UIButton) {
        answer(sender)
        answerTimes.text = String("\(rightAnswer) of \(answersCount)")
        answerRateLabel.text = "\(answerRate) %"
    }
    
    @IBAction func reset(_ sender: UIButton) {
        resetCount()
        answerTimes.text = String("0 of 0")
        answerRateLabel.text = "0 %"
        refreshUI(by: range)
    }
    
    @IBAction func quit(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    override func play() {
        audio.play(question: question, folder: .chord)
    }
    
    override func refreshUI(by range: Set<String>) {
        major3rd.setButton(by: range)
        minor3rd.setButton(by: range)
        augmented3rd.setButton(by: range)
        diminished3rd.setButton(by: range)
        major7th.setButton(by: range)
        minor7th.setButton(by: range)
        dominant7th.setButton(by: range)
        diminished7th.setButton(by: range)
        halfDiminished7th.setButton(by: range)
    }
    
    override func lockAllBtn() {
        major3rd.isEnabled = false
        minor3rd.isEnabled = false
        augmented3rd.isEnabled = false
        diminished3rd.isEnabled = false
        major7th.isEnabled = false
        minor7th.isEnabled = false
        dominant7th.isEnabled = false
        diminished7th.isEnabled = false
        halfDiminished7th.isEnabled = false
    }
}


