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

    private var workspaceController:WorkspaceController!

    override init() {
		
    }
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
		
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    
    @IBAction func undo(_ sender: NSMenuItem) {
        ensureWorkspaceSetup()
        workspaceController.workspace.undo()
    }
    
    @IBAction func redo(_ sender: NSMenuItem) {
        ensureWorkspaceSetup()
        workspaceController.workspace.redo()
    }
    
    private func ensureWorkspaceSetup(){
        //inject the workspace in the entry panel
        workspaceController=NSApplication.shared().mainWindow?.windowController?.contentViewController as? WorkspaceController
    }
}

