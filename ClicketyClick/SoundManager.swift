//
//  SoundManager.swift
//  ClicketyClick
//
//  Created by Abdoulaye Dia on 04/11/2023.
//

import Foundation

class SoundManager {
    static let shared = SoundManager()
    
    var soundPlayer: SoundPlayer
    
    private init() {
        soundPlayer = SoundPlayer()
    }
    
    func playSound(for keyName: String, state keyState: KeyState = .pressed) {
        soundPlayer.playSound(for: keyName, state: keyState)
    }
}
