//
//  CreateRectangle.swift
//  MemoryWall
//
//  Created by Nikhil Verma on 7/28/17.
//  Copyright © 2017 Nikhil Verma. All rights reserved.
//

import Foundation
import Cocoa

class CreateRectangle: Command,PressDragReleaseProcessor {
	
	private var workspace:Workspace
	
	init(_ workspace:Workspace){
		self.workspace=workspace;
	}
	
	func execute(){
		
	}
	
	func unExecute(){
		
	}
	
	func getName()->String{
		return "Create Rectangle"
	}
	
	func updateAffectedViews(afterExecution:Bool){
		
	}
	
	func mousePressed(with event:NSEvent){
		
	}
	
	func mouseDragged(with event:NSEvent){
		
	}
	
	func mouseReleased(with event:NSEvent){
		
	}
	
}
