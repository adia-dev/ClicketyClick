//
//  Key.swift
//  ClicketyClick
//
//  Created by Abdoulaye Dia on 05/11/2023.
//

import Foundation

struct Key: Codable {
    let code: UInt16
    let state: KeyState
    var soundEffect: SoundEffect?
    
    init(code: UInt16, state: KeyState = .released, soundEffect: SoundEffect? = nil) {
        self.code = code
        self.state = state
        self.soundEffect = soundEffect
    }
}
