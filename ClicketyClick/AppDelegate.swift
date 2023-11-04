//
//  AppDelegate.swift
//  ClicketyClick
//
//  Created by Abdoulaye Dia on 04/11/2023.
//

import Cocoa
import Foundation
import SwiftUI

class AppDelegate: NSObject, NSApplicationDelegate {
    var keyboardEventHandler: KeyboardEventHandler?
    var statusItem: NSStatusItem?
    var popOver = NSPopover()

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        keyboardEventHandler = KeyboardEventHandler()
        NSEvent.addLocalMonitorForEvents(matching: [.keyDown, .keyUp], handler: { event -> NSEvent? in
            self.keyboardEventHandler?.handle(event: event)
            return nil // Suppress the default system beep by returning nil
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

        // SoundPlayer.loadSounds() <- This returns a warning on the console
        /*
         * AddInstanceForFactory: No factory registered for id <CFUUID 0x600000XXXXXX>
         * F8BB1C28-XXXX-XXXXXXX
         *
         * HALC_ProxyObjectMap.cpp:153  HALC_ProxyObjectMap::_CopyObjectByObjectID: failed to create the
         * local object
         *
         * HALC_ShellDevice.cpp:2 609  HALC_ShellDevice::RebuildControlList: couldn't find the control
         * object
         *
         *
         */
    }

    @objc func MenuButtonToggle(sender: AnyObject) {
        if popOver.isShown{
            popOver.performClose(sender)
        }else {
            if let menuButton = statusItem?.button {
                popOver.show(relativeTo: menuButton.bounds, of: menuButton, preferredEdge: NSRectEdge.minY)
            }
        }
    }
}
