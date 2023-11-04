//
//  KeyboardEventHandler.swift
//  ClicketyClick
//
//  Created by Abdoulaye Dia on 04/11/2023.
//

import Foundation
import Cocoa

class KeyboardEventHandler: NSResponder {
    func handle(event: NSEvent) {
        guard let keyString = event.characters else { return }
        switch event.type {
        case .keyDown:
            SoundPlayer.playSound(for: keyString, state: .pressed)
        case .keyUp:
            SoundPlayer.playSound(for: keyString, state: .released)
        default:
            break
        }
    }
}
