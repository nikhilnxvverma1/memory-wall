//
//  WallCellView.swift
//  MemoryWall
//
//  Created by Nikhil Verma on 2/22/17.
//  Copyright © 2017 Nikhil Verma. All rights reserved.
//

import Cocoa

class WallCellView: NSView {

	private var _delegate:WallCellViewDelegate!
	
	var delegate:WallCellViewDelegate{
		get{
			return _delegate
		}
		set{
			_delegate=newValue
		}
	}
	
    override func draw(_ dirtyRect: NSRect) {
		//set the background color in case this cell is selected
		if(delegate.isSelected){
			NSColor.blue.setFill()
			NSRectFill(dirtyRect)
		}
		
        super.draw(dirtyRect)


//		let textfield = viewWithTag(1) as! NSTextField
//		let thumbnail = viewWithTag(1) as! NSImageView
//		textfield.stringValue=delegate.wall.name!
//		thumbnail.image=delegate.wall.thumbnail
    }
	
	override func mouseUp(with event: NSEvent) {
		super.mouseUp(with: event)
		if(event.clickCount==2){
			delegate.doubleClickedWallCell()
		}
	}
	
}

protocol WallCellViewDelegate {
	func doubleClickedWallCell()
	
	//property requirements
	var isSelected: Bool { get }
	var wall: Wall { get }
}
