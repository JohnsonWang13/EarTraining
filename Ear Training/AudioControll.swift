//
//  PlaySound.swift
//  Ear Training
//
//  Created by 王富生 on 2017/2/15.
//  Copyright © 2017年 王富生. All rights reserved.
//

import Foundation
import AVFoundation

class Audio {
    
    private var audioPlayer: AVAudioPlayer?
    
    func play(question: String, folder: AudioFolder) {
        
        let audioPath = Bundle.main.path(forResource: question, ofType: "wav", inDirectory: folder.rawValue)
        
        do {
            let url = URL(fileURLWithPath: audioPath!)
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            guard audioPlayer != nil else { return }
        } catch let error as NSError {
            print(error.description)
        }
        audioPlayer?.prepareToPlay()
        audioPlayer?.play()
    }
}

enum AudioFolder: String {
    
    case notes = "Audio/Note"
    case interval = "Audio/Interval"
    case scale = "Audio/Scale"
    case chord = "Audio/Chord"
}
