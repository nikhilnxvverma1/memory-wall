//
//  CreateCircle.swift
//  MemoryWall
//
//  Created by Nikhil Verma on 7/29/17.
//  Copyright © 2017 Nikhil Verma. All rights reserved.
//

import Foundation
import Cocoa

class CreateCircle: Command,PressDragReleaseProcessor {
	
	private var workspace:Workspace
	
	init(_ workspace:Workspace){
		self.workspace=workspace;
	}
	
	func execute(){
		
	}
	
	func unExecute(){
		
	}
	
	func getName()->String{
		return "Create Circle"
	}
	
	func updateAffectedViews(afterExecution:Bool){
		
	}
	
	func mousePressed(with event:NSEvent){
		//TODO create a CGCircle
	}
	
	func mouseDragged(with event:NSEvent){
		
	}
	
	func mouseReleased(with event:NSEvent){
		
	}
	
}
