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
	private var artboard:Wall
	private var previousSelection:Wall?
	
	init(workspace:Workspace,name:String){
		self.workspace=workspace;
		artboard=Wall()
		artboard.name=name
		
		//get the previous wall if exists, if doesn't get the last wall in list, if possible
		previousSelection = workspace.selectedWall != nil ? workspace.selectedWall : workspace.wallList.count>0 ? workspace.wallList.last : nil
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
