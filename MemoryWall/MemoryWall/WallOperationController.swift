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
	
	@IBAction func deleteWall(_ sender: NSButton) {
		if(container.workspace.selectedWall==nil){
			return
		}
		let deleteWall=DeleteWall(container.workspace.selectedWall,container.wallListController.wallListCollection,container.workspace)
		container.workspace.comit(command: deleteWall,execute: true)
	}
	@IBAction func circlePressed(_ sender: Any) {
		container.workspace.tool=Tool.Circle
	}
	
	@IBAction func rectanglePressed(_ sender: Any) {
		container.workspace.tool=Tool.Rectangle
	}
}
