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
    private var entryPanelController:EntryPanelController;
    private var workspaceController:WorkspaceController!

    override init() {
        self.statusItem=NSStatusBar.system().statusItem(withLength: NSVariableStatusItemLength);
        self.entryPanelController=EntryPanelController();
    }
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        
        statusItem.title="Memory";
        statusItem.menu=self.entryPanelController.entryMenu;
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
        entryPanelController.workspace=workspaceController?.workspace
    }
}

