//
//  KeyboardEventHandler.swift
//  ClicketyClick
//
//  Created by Abdoulaye Dia on 04/11/2023.
//

import Foundation
import Cocoa

class KeyboardEventHandler: NSResponder {
    var delegate: KeyboardActionHandler?
    
    func handle(event: NSEvent) {
        switch event.type {
        case .keyDown:
            delegate?.keyDown(with: event)
        case .keyUp:
            delegate?.keyUp(with: event)
        default:
            break
        }
    }
    
    func setDelegate(_ newDelegate: KeyboardActionHandler?) {
        delegate = newDelegate
    }
}

protocol KeyboardActionHandler {
    func keyDown(with event: NSEvent)
    func keyUp(with event: NSEvent)
}
