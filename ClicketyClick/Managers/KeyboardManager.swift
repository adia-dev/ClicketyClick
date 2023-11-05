//
//  InputManager.swift
//  ClicketyClick
//
//  Created by Abdoulaye Dia on 04/11/2023.
//

import Foundation
import SwiftUI

class KeyboardManager {
    static let shared = KeyboardManager()

    var keyboardEventHandler: KeyboardEventHandler
    private var lastPressedKey: String?
    private var keys: [Key] = []

    private init() {
        keyboardEventHandler = KeyboardEventHandler()
        keyboardEventHandler.setDelegate(self)
        keys = DataLoader.loadKeys(from: "keys")
    }

    func setKeyboardDelegate(_ delegate: KeyboardActionHandler?) {
        keyboardEventHandler.setDelegate(delegate)
    }

    func getKey(_ code: UInt16, state: KeyState? = nil) -> Key? {
        for key in keys {
            if key.code == code {
                if let unwrappedState = state {
                    if key.state == unwrappedState {
                        return key
                    }
                } else {
                    return key
                }
            }
        }

        return nil
    }

    var lastKey: String? {
        return lastPressedKey
    }
    
    var getKeys: [Key] {
        return keys
    }
}

extension KeyboardManager: KeyboardActionHandler {
    func keyDown(with event: NSEvent) {
        guard let keyString = event.characters else { return }
        lastPressedKey = keyString // Update the lastPressedKey property
        keyboardEventHandler.delegate?.keyDown(with: event) // Forward the event to the delegate
    }

    func keyUp(with event: NSEvent) {
        keyboardEventHandler.delegate?.keyUp(with: event) // Forward the event to the delegate
    }
}

