//
//  ViewController.swift
//  Ear Training
//
//  Created by 王富生 on 2017/1/10.
//  Copyright © 2017年 王富生. All rights reserved.
//

import UIKit

class IntervalVC: BaseViewController, SettingDelegate {
    
    @IBOutlet weak var referenceBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        allQuestion = ["Unison", "Minor 2nd", "Major 2nd", "Minor 3rd", "Major 3rd", "Perfect 4th", "Tritone", "Perfect 5th", "Minor 6th", "Major 6th", "Minor 7th", "Major 7th", "Octave"]
        range = Status.status.intervalRange
        compass =  ["1", "2", "3", "4", "5", "6", "7"]
        
        answersCount = Status.status.intervalAnswerTimes
        rightAnswer = Status.status.intervalRightTimes
        answerTimes.text = String("\(rightAnswer) of \(answersCount)")
        
        
        major2nd.angle = 30
        major3rd.angle = 60
        perfect5th.angle = 90
        major6th.angle = 120
        major7th.angle = 150
        octave.angle = 180
        
        minor3rd.angle = 35
        perfect4th.angle = 70
        tritone.angle = 105
        minor6th.angle = 140
        minor7th.angle = 175
        
        conductingView.layer.contents = UIImage(named: "IdleOrigin")?.cgImage
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        Status.status.intervalRange = range
        Status.status.intervalAnswerTimes = answersCount
        Status.status.intervalRightTimes = rightAnswer
    }
    
    @IBAction func backButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! IntervalSettingVC
        destination.delegate = self
    }
    
    @IBOutlet weak var unsion: IntervalOuterRing!
    @IBOutlet weak var minor2nd: IntervalInnerRing!
    @IBOutlet weak var major2nd: IntervalOuterRing!
    @IBOutlet weak var minor3rd: IntervalInnerRing!
    @IBOutlet weak var major3rd: IntervalOuterRing!
    @IBOutlet weak var perfect4th: IntervalInnerRing!
    @IBOutlet weak var tritone: IntervalInnerRing!
    @IBOutlet weak var perfect5th: IntervalOuterRing!
    @IBOutlet weak var minor6th: IntervalInnerRing!
    @IBOutlet weak var major6th: IntervalOuterRing!
    @IBOutlet weak var minor7th: IntervalInnerRing!
    @IBOutlet weak var major7th: IntervalOuterRing!
    @IBOutlet weak var octave: IntervalOuterRing!
    
    
    
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
        audio.play(question: question, folder: .interval)
    }
    
    override func refreshUI(by range: Set<String>) {
        unsion.setButton(by: range)
        minor2nd.setButton(by: range)
        major2nd.setButton(by: range)
        minor3rd.setButton(by: range)
        major3rd.setButton(by: range)
        perfect4th.setButton(by: range)
        tritone.setButton(by: range)
        perfect5th.setButton(by: range)
        minor6th.setButton(by: range)
        major6th.setButton(by: range)
        minor7th.setButton(by: range)
        major7th.setButton(by: range)
        octave.setButton(by: range)
    }
    
    override func lockAllBtn() {
        unsion.isEnabled = false
        minor2nd.isEnabled = false
        major2nd.isEnabled = false
        minor3rd.isEnabled = false
        major3rd.isEnabled = false
        tritone.isEnabled = false
        perfect5th.isEnabled = false
        minor6th.isEnabled = false
        minor7th.isEnabled = false
        major7th.isEnabled = false
        octave.isEnabled = false
    }
}


