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
}

