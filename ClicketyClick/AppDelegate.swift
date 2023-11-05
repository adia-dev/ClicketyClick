//
//  AppDelegate.swift
//  ClicketyClick
//
//  Created by Abdoulaye Dia on 04/11/2023.
//

import Cocoa
import SwiftUI

class AppDelegate: NSObject, NSApplicationDelegate {
    var statusItem: NSStatusItem?
    var popOver = NSPopover()
    var eventMonitor: Any?

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        InputManager.shared.setKeyboardDelegate(SoundManager.shared.soundPlayerService)
        
        let accessEnabled = AXIsProcessTrustedWithOptions(
                    [kAXTrustedCheckOptionPrompt.takeUnretainedValue() as String: true] as CFDictionary)
        
        print("Enabled the access to the keyboard: \(accessEnabled)")

        eventMonitor = NSEvent.addGlobalMonitorForEvents(matching: [.keyDown, .keyUp], handler: { event in
            print("Hello World")
            InputManager.shared.keyboardEventHandler.handle(event: event)  // Handle keyboard events
        })

        let menuView = MenuView()

        popOver.behavior = .transient
        popOver.animates = true

        popOver.contentViewController = NSViewController()
        popOver.contentViewController?.view = NSHostingView(rootView: menuView)
        
        popOver.contentViewController?.view.window?.makeKey()

        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)

        if let MenuButton = statusItem?.button {
            MenuButton.image = NSImage(systemSymbolName: "keyboard", accessibilityDescription: nil)
            MenuButton.action = #selector(MenuButtonToggle)
        }
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        if let eventMonitor = eventMonitor {
            NSEvent.removeMonitor(eventMonitor)
        }
    }

    @objc func MenuButtonToggle(sender: AnyObject) {
        if popOver.isShown {
            popOver.performClose(sender)
        } else {
            if let menuButton = statusItem?.button {
                popOver.show(relativeTo: menuButton.bounds, of: menuButton, preferredEdge: NSRectEdge.minY)
            }
        }
    }
}
