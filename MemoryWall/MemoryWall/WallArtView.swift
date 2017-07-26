//
//  WallArtView.swift
//  MemoryWall
//
//  Created by Nikhil Verma on 2/18/17.
//  Copyright © 2017 Nikhil Verma. All rights reserved.
//

import Cocoa

class WallArtView: NSView {

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
        NSColor.gray.setFill();
        NSRectFill(dirtyRect);
        super.draw(dirtyRect);
    }
	
	override func mouseDown(with event: NSEvent) {
		//TODO
		NSLog("came here at mouse down")
	}
	
	override func mouseDragged(with event: NSEvent) {
		//TODO
		NSLog("came here at mouse dragged")
	}
	
	override func mouseUp(with event: NSEvent) {
		//TODO
		NSLog("came here at mouse up")
	}
	
	
    
}
