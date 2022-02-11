//
//  AppDelegate.swift
//  JsonTouchID
//  Uses RNCryptor to interface with the TouchID framework
//  Meant as a PoC so InputA and InputB would be joined into a field in a json document
//  The json document would then only be readable when TouchID was used to retrieve the ECC key
//  Could also store the contents of that json document in a single field in user defaults or 
//  instead use Core Storage/Keychain. However, for native mongo/nosql operations it is can be
//  cheaper to keep them in natitve json.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }


}

