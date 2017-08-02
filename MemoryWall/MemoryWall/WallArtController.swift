//
//  WallArtController.swift
//  MemoryWall
//
//  Created by Nikhil Verma on 2/18/17.
//  Copyright © 2017 Nikhil Verma. All rights reserved.
//

import Cocoa

class WallArtController: NSViewController {
    
    var container:WorkspaceController!;

    override func viewDidLoad() {
        super.viewDidLoad()
		
        // Do view setup here.
		
		let wallArtView = self.view as? WallArtView
		wallArtView?.workspace=container.workspace
    }
    
	func receiveWorkspaceController(_ controller:WorkspaceController){
		container=controller
		container.wallArtController=self
	}
	
}
