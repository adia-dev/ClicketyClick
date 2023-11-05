//
//  InputManager.swift
//  ClicketyClick
//
//  Created by Abdoulaye Dia on 04/11/2023.
//

import Foundation
import SwiftUI

class InputManager {
    static let shared = InputManager()

    var keyboardEventHandler: KeyboardEventHandler
    private var lastPressedKey: String?

    private init() {
        keyboardEventHandler = KeyboardEventHandler()
        keyboardEventHandler.setDelegate(self)
    }
    
    func setKeyboardDelegate(_ delegate: KeyboardActionHandler?) {
        keyboardEventHandler.setDelegate(delegate)
    }
    
    var lastKey: String? {
        return lastPressedKey
    }
}

extension InputManager: KeyboardActionHandler {
    func keyDown(with event: NSEvent) {
        guard let keyString = event.characters else { return }
        lastPressedKey = keyString  // Update the lastPressedKey property
        keyboardEventHandler.delegate?.keyDown(with: event)  // Forward the event to the delegate
    }
    
    func keyUp(with event: NSEvent) {
        keyboardEventHandler.delegate?.keyUp(with: event)  // Forward the event to the delegate
    }
}
