//
//  WorkspaceController.swift
//  MemoryWall
//
//  Created by Nikhil Verma on 2/18/17.
//  Copyright © 2017 Nikhil Verma. All rights reserved.
//

import Cocoa

class WorkspaceController: NSViewController {

	private var _workspace:Workspace!
	var wallListController:WallListController!
	var wallArtController:WallArtController!
	var wallOperationController:WallOperationController!
	
	var workspace:Workspace{
		get{
			return _workspace
		}
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        _workspace=Workspace()
        for childController in childViewControllers{
			childController.perform(Selector(("receiveWorkspaceController:")), with:self)
			
        }
        
    }
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    func recieveManagedObjectContext(_ managedObjectContext:NSManagedObjectContext){
        workspace.managedObjectContext=managedObjectContext
    }

}
