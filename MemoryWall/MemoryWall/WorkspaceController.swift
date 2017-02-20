//
//  WorkspaceController.swift
//  MemoryWall
//
//  Created by Nikhil Verma on 2/18/17.
//  Copyright © 2017 Nikhil Verma. All rights reserved.
//

import Cocoa

class WorkspaceController: NSViewController {

    var workspace:Workspace!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        workspace=Workspace()
        for childController in childViewControllers{
            childController.perform(Selector(("receiveWorkspace:")), with: workspace);
        }
        
    }
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    func recieveManagedObjectContext(_ managedObjectContext:NSManagedObjectContext){
        workspace.managedObjectContext=managedObjectContext;
    }

}
