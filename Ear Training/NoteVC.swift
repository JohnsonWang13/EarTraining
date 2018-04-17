//
//  ViewController.swift
//  Ear Training
//
//  Created by 王富生 on 2017/1/10.
//  Copyright © 2017年 王富生. All rights reserved.
//

import UIKit

class NoteVC: BaseViewController, sendPickViewRow, NoteSettingDelegate {
    
    var reference = 0
    
    func reference<T>(_ t: T) {
        
        if let int = t as? Int {
            
            reference = int
            referenceNote = allQuestion[int] + "3"
            referenceBtn.setTitle(allQuestion[reference], for: .normal)
        }
    }
    
    private var referenceNote = "C3"
    
    @IBOutlet weak var referenceBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        allQuestion = ["C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"]
        range = Status.status.notesRange
        reference = Status.status.noteReference
        referenceBtn.setTitle(allQuestion[reference], for: .normal)
        
        compass = ["2", "3", "4"]
        
        Reference.shared.delegate = self
        self.changeQuestion(self.allQuestion, inRange: self.range, random: self.compass)
        
        answersCount = Status.status.noteAnswerTimes
        rightAnswer = Status.status.noteRightTimes
        answerTimes.text = String("\(rightAnswer) of \(answersCount)")
        
        D.angle = 30
        E.angle = 60
        F.angle = 90
        G.angle = 120
        A.angle = 150
        B.angle = 180
        
        DSharp.angle = 35
        FSharp.angle = 105
        GSharp.angle = 140
        ASharp.angle = 175
        
        conductingView.layer.contents = UIImage(named: "IdleOrigin")?.cgImage
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        Status.status.notesRange = range
        Status.status.noteReference = reference
        Status.status.noteAnswerTimes = answersCount
        Status.status.noteRightTimes = rightAnswer
    }
    
    @IBAction func backButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destination = segue.destination as! NoteSettingVC
        destination.delegate = self
    }
    
    @IBOutlet weak var C: NoteOuterRing!
    @IBOutlet weak var CSharp: NoteInnerRing!
    @IBOutlet weak var D: NoteOuterRing!
    @IBOutlet weak var DSharp: NoteInnerRing!
    @IBOutlet weak var E: NoteOuterRing!
    @IBOutlet weak var F: NoteOuterRing!
    @IBOutlet weak var FSharp: NoteInnerRing!
    @IBOutlet weak var G: NoteOuterRing!
    @IBOutlet weak var GSharp: NoteInnerRing!
    @IBOutlet weak var A: NoteOuterRing!
    @IBOutlet weak var ASharp: NoteInnerRing!
    @IBOutlet weak var B: NoteOuterRing!
    
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
    
    @IBAction func playReference() {
        
        audio.play(question: referenceNote, folder: .notes)
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
    
    
    override func refreshUI(by range: Set<String>) {
        
        C.setButton(by: range)
        CSharp.setButton(by: range)
        D.setButton(by: range)
        DSharp.setButton(by: range)
        E.setButton(by: range)
        F.setButton(by: range)
        FSharp.setButton(by: range)
        G.setButton(by: range)
        GSharp.setButton(by: range)
        A.setButton(by: range)
        ASharp.setButton(by: range)
        B.setButton(by: range)
    }
    
    override func lockAllBtn() {
        
        C.isEnabled = false
        CSharp.isEnabled = false
        D.isEnabled = false
        DSharp.isEnabled = false
        E.isEnabled = false
        F.isEnabled = false
        FSharp.isEnabled = false
        G.isEnabled = false
        GSharp.isEnabled = false
        A.isEnabled = false
        ASharp.isEnabled = false
        B.isEnabled = false
    }
}


