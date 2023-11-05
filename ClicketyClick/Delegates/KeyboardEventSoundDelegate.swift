//
//  KeyboardEventSoundDelegate.swift
//  ClicketyClick
//
//  Created by Abdoulaye Dia on 05/11/2023.
//

import Foundation
import SwiftUI

class KeyboardEventSoundDelegate: KeyboardActionHandler {
    func keyUp(with event: NSEvent) {
        if let key = KeyboardManager.shared.getKey(event.keyCode, state: .released) {
            if let sfx = key.soundEffect {
                SoundManager.shared.playSound(sfx)
            }
        }
    }

    func keyDown(with event: NSEvent) {
        if let key = KeyboardManager.shared.getKey(event.keyCode, state: .pressed) {
            if let sfx = key.soundEffect {
                SoundManager.shared.playSound(sfx)
            }
        }
    }
}
