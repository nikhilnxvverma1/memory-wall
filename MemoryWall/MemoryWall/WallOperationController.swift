//
//  WallOperationController.swift
//  MemoryWall
//
//  Created by Nikhil Verma on 2/18/17.
//  Copyright © 2017 Nikhil Verma. All rights reserved.
//

import Cocoa

class WallOperationController: NSViewController {

    var container:WorkspaceController!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
	func receiveWorkspaceController(_ controller:WorkspaceController){
		container=controller
		container.wallOperationController=self
	}
}
