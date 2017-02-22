//
//  CreateWall.swift
//  MemoryWall
//
//  Created by Nikhil Verma on 2/18/17.
//  Copyright © 2017 Nikhil Verma. All rights reserved.
//

import Cocoa

class CreateWall: Command {
    
    var workspace:Workspace
    var wall:Wall
    var wallListCollection:NSCollectionView
    
    init(workspace:Workspace,name:String,wallListCollection:NSCollectionView){
        self.workspace=workspace;
        wall=Wall()
		wall.name=name
        self.wallListCollection=wallListCollection
    }
    
    func execute(){
		wall.persist(workspace.managedObjectContext)
		workspace.wallList.append(wall)
    }
    
    func unExecute(){
		wall.unpersist(workspace.managedObjectContext)
		workspace.wallList.remove(at: workspace.wallList.index(of: wall)!)
    }
    
    func getName()->String{
        return "Create wall";
    }
    
	func updateAffectedViews(afterExecution:Bool){
        wallListCollection.reloadData()
		
		//maintain selection of current wall
		if(workspace.selectedWall==nil){
			return
		}
		let index=workspace.wallList.index(of: workspace.selectedWall)//TODO check if the current selection is this new wall itself
		let selectedItemPath=IndexPath(item: index!, section: 0)
		if(afterExecution){
			wallListCollection.selectItems(at: [selectedItemPath], scrollPosition: NSCollectionViewScrollPosition.bottom)
		}else{
			wallListCollection.selectItems(at: [selectedItemPath], scrollPosition: NSCollectionViewScrollPosition.bottom)
		}
		
    }
    
}
