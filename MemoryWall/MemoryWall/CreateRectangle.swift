//
//  CreateRectangle.swift
//  MemoryWall
//
//  Created by Nikhil Verma on 7/28/17.
//  Copyright © 2017 Nikhil Verma. All rights reserved.
//

import Foundation

class CreateRectangle: Command,PressDragReleaseProcessor {
	
	private var workspace:Workspace
	
	init(workspace:Workspace){
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
	
	func mousePressed(){
		
	}
	
	func mouseDragged(){
		
	}
	
	func mouseReleased(){
		
	}
	
}
