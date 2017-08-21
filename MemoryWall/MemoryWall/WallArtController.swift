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
    }
    
	func receiveWorkspaceController(_ controller:WorkspaceController){
		container=controller
		container.wallArtController=self
	}
	
	override func mouseUp(with event: NSEvent) {
		print("Mouse Up")
	}
	
	override func mouseDragged(with event: NSEvent) {
		print("Mouse dragged")
	}
	
	override func mouseDown(with event: NSEvent) {
		print("Mouse down")
	}
	
}
