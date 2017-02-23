//
//  ChangeWallName.swift
//  MemoryWall
//
//  Created by Nikhil Verma on 2/18/17.
//  Copyright © 2017 Nikhil Verma. All rights reserved.
//

import Cocoa

class ChangeWallName: Command {
	
	private var workspace:Workspace
	private var wallListCollection:NSCollectionView
	private var wall:Wall
	private var oldName:String
	private var newName:String
	
	init(_ wall:Wall,_ newName:String,_ wallListCollection:NSCollectionView,_ workspace:Workspace) {
		self.wall=wall
		self.newName=newName
		self.oldName=wall.name!
		self.wallListCollection=wallListCollection
		self.workspace=workspace
	}
	
    func execute(){
        self.wall.name=newName
    }
    
    func unExecute(){
        self.wall.name=oldName
    }
    
    func getName()->String{
        return "Change wall's name";
    }
    
    func updateAffectedViews(afterExecution:Bool){
        wallListCollection.reloadData()
		
		let index=workspace.wallList.index(of: wall)!
		wallListCollection.selectItems(at: [IndexPath(item: index, section: 0)],
		                               scrollPosition: NSCollectionViewScrollPosition.bottom)
    }
    
}
