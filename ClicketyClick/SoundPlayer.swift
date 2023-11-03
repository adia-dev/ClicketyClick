//
//  SoundPlayer.swift
//  ClicketyClick
//
//  Created by Abdoulaye Dia on 04/11/2023.
//

import Foundation
import AVFoundation

class SoundPlayer {
    var keyPressPlayer: AVAudioPlayer?
    var keyReleasePlayer: AVAudioPlayer?

    init() {
        // Preload key press sound
        if let keyPressURL = Bundle.main.url(forResource: "keyPressed", withExtension: "m4a") {
            keyPressPlayer = try? AVAudioPlayer(contentsOf: keyPressURL)
            keyPressPlayer?.prepareToPlay()
        }
        
        // Preload key release sound
        if let keyReleaseURL = Bundle.main.url(forResource: "keyReleased", withExtension: "m4a") {
            keyReleasePlayer = try? AVAudioPlayer(contentsOf: keyReleaseURL)
            keyReleasePlayer?.prepareToPlay()
        }
    }
    
    func playKeyPressSound() {
        keyPressPlayer?.currentTime = 0  // Reset to start if sound is in the middle
        keyPressPlayer?.play()
    }
    
    func playKeyReleaseSound() {
        keyReleasePlayer?.currentTime = 0  // Reset to start if sound is in the middle
        keyReleasePlayer?.play()
    }
}
