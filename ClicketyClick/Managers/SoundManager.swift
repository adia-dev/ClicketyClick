//
//  SoundManager.swift
//  ClicketyClick
//
//  Created by Abdoulaye Dia on 04/11/2023.
//

import Foundation

class SoundManager {
    static let shared = SoundManager()
    
    var soundPlayerService: SoundPlayerService
    
    private init() {
        soundPlayerService = SoundPlayerService()
    }
    
    func playSound(for keyName: String, state keyState: KeyState = .pressed) {
        soundPlayerService.playSound(for: keyName, state: keyState)
    }
}
