//
//  AppDelegate.swift
//  MemoryWall
//
//  Created by Nikhil Verma on 2/17/17.
//  Copyright © 2017 Nikhil Verma. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    private var statusItem:NSStatusItem;

    override init() {
        self.statusItem=NSStatusBar.system().statusItem(withLength: NSVariableStatusItemLength);
    }
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        statusItem.title="MyItem";
        updateStatusItem(statusItem: statusItem);
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    func updateStatusItem(statusItem:NSStatusItem){
        let menu=NSMenu();
        menu.addItem(withTitle: "first", action: nil, keyEquivalent: "");
        menu.addItem(withTitle: "second", action: nil, keyEquivalent: "");
        menu.addItem(withTitle: "third", action: nil, keyEquivalent: "");
        statusItem.menu=menu;
    }
    
}

