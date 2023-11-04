//
//  SoundPlayer.swift
//  ClicketyClick
//
//  Created by Abdoulaye Dia on 04/11/2023.
//

import Foundation
import AVFoundation

class SoundPlayer {
    
    private static var soundPlayers: [String: AVAudioPlayer] = [:]
     private static let _initializer: Void = {
         loadSounds()
     }()
    
     private static func ensureInitialization() {
         _ = _initializer
     }

    static func loadSounds() {
        var soundIdentifiers: [String] = []
        let states: [KeyState] = [.pressed, .released]
        
        for scalar in "abcdefghijklmnopqrstuvwxyz".unicodeScalars {
            for state in states {
                let soundIdentifier = "\(scalar)_\(state)"
                soundIdentifiers.append(soundIdentifier)
            }
        }
        
        soundIdentifiers.append("default_pressed")
        soundIdentifiers.append("default_released")
        
        for identifier in soundIdentifiers {
            if let url = Bundle.main.url(forResource: identifier, withExtension: "m4a"),
               let player = try? AVAudioPlayer(contentsOf: url) {
                player.prepareToPlay()
                soundPlayers[identifier] = player
            }
        }
        
        for (key, _) in soundPlayers {
            print(key)
        }
    }

    static func playSound(for keyName: String, state keyState: KeyState = .pressed) {
        ensureInitialization()
        
        let soundKey = "\(keyName)_\(keyState)"
        guard let player = soundPlayers[soundKey] else {
            let defaultSoundKey = "default_\(keyState)"
            soundPlayers[defaultSoundKey]?.currentTime = 0
            soundPlayers[defaultSoundKey]?.play()
            return
        }
        player.currentTime = 0
        player.play()
    }
}
