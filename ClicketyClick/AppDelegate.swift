//
//  AppDelegate.swift
//  ClicketyClick
//
//  Created by Abdoulaye Dia on 04/11/2023.
//

import Foundation
import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {
    var keyboardEventHandler: KeyboardEventHandler?

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        keyboardEventHandler = KeyboardEventHandler()
        NSEvent.addLocalMonitorForEvents(matching: [.keyDown, .keyUp], handler: { (event) -> NSEvent? in
            self.keyboardEventHandler?.handle(event: event)
            return nil  // Suppress the default system beep by returning nil
        })
    }
}

