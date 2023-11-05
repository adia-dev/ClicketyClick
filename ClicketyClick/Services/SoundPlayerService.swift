//
//  SoundPlayerService.swift
//  ClicketyClick
//
//  Created by Abdoulaye Dia on 04/11/2023.
//

import AVFoundation
import Foundation
import SwiftUI

class SoundPlayerService: KeyboardActionHandler {
    private var soundPlayers: [String: AVAudioPlayer] = [:]
        
    init() {
        loadSounds()
    }

    func loadSounds() {
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
               let player = try? AVAudioPlayer(contentsOf: url)
            {
                player.prepareToPlay()
                soundPlayers[identifier] = player
            }
        }
    }

    func playSound(for keyName: String, state keyState: KeyState = .pressed) {
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
    
    func keyDown(with event: NSEvent) {
        // You can extract the key character from the event if needed
        guard let keyString = event.characters else { return }
        playSound(for: keyString, state: .pressed)
    }
    
    func keyUp(with event: NSEvent) {
        guard let keyString = event.characters else { return }
        playSound(for: keyString, state: .released)
    }
}
