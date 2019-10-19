//
//  AudioController.swift
//  BlindShot
//
//  Created by Mariia Turchina on 17/09/2019.
//  Copyright © 2019 Mariia Turchina. All rights reserved.
//

import Foundation
import AVFoundation

extension ViewController {
    
    func audioCommunicate(fileName : String, stop : Bool){
        
        if let soundURL = Bundle.main.url(forResource: fileName, withExtension: "m4a"){
            print("sound URL *** ", soundURL as Any)
                
            do {
                try audioPlayer = AVAudioPlayer.init(contentsOf: soundURL)
                if (stop){
                    audioPlayer?.stop()
                } else {
                    audioPlayer?.numberOfLoops = -1
                    audioPlayer?.play()
                }
            } catch {
                print("Error playing sound")
            }
        } else {
            print("No such URL found")
        }
    //}
        
        /*let soundURL = Bundle.main.url(forResource: fileName, withExtension: "m4a")
        print("sound URL : ", soundURL)
        
        do {
            try audioPlayer = AVAudioPlayer(contentsOf:  soundURL!)
        } catch {
            print("Error playing sound")
        }
        
        if (stop){
            audioPlayer.stop()
        } else {
            audioPlayer.numberOfLoops = -1
            audioPlayer.play()
        }*/
    }
    
}
