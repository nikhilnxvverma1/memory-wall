//
//  EntryPanelController.swift
//  MemoryWall
//
//  Created by Nikhil Verma on 2/18/17.
//  Copyright © 2017 Nikhil Verma. All rights reserved.
//

import Cocoa

class EntryPanelController: NSViewController {
    
    
    var entryMenu: NSMenu?
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: Bundle!) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)!
    }
    
    convenience init() {
        self.init(nibName: nil, bundle: nil)
        self.entryMenu=self.createMenu();
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        Bundle.main.loadNibNamed("EntryPanelController", owner: nil, topLevelObjects: nil);
    }
    
    func createMenu()->NSMenu{
        
        Bundle.main.loadNibNamed("EntryPanelController", owner: self, topLevelObjects: nil);
        
        let viewItem=NSMenuItem();
        viewItem.view=self.view;
        
        let menu=NSMenu();
//        menu.addItem(withTitle: "entry1", action: nil, keyEquivalent: "");
//        menu.addItem(withTitle: "entry2", action: nil, keyEquivalent: "");
//        menu.addItem(withTitle: "entry3", action: nil, keyEquivalent: "");
        menu.addItem(viewItem);
        return menu;
    }
    
    @IBAction func saveGenericEntry(_ sender: Any) {
        print("TODO saving generic entry");
    }
}
