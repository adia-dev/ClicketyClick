//
//  KeyboardEventHandler.swift
//  ClicketyClick
//
//  Created by Abdoulaye Dia on 04/11/2023.
//

import Foundation
import Cocoa

class KeyboardEventHandler: NSResponder {
    let soundPlayer = SoundPlayer()

    func handle(event: NSEvent) {
        switch event.type {
        case .keyDown:
            soundPlayer.playKeyPressSound()
        case .keyUp:
            soundPlayer.playKeyReleaseSound()
        default:
            break
        }
    }
}
