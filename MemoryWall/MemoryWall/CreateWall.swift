//
//  CreateWall.swift
//  MemoryWall
//
//  Created by Nikhil Verma on 2/18/17.
//  Copyright © 2017 Nikhil Verma. All rights reserved.
//

import Cocoa

class CreateWall: Command {
    
    private var workspace:Workspace
    private var wall:Wall
    private var wallListCollection:NSCollectionView
	private var previousSelection:Wall?
    
    init(workspace:Workspace,name:String,wallListCollection:NSCollectionView){
        self.workspace=workspace;
        wall=Wall()
		wall.name=name
        self.wallListCollection=wallListCollection
		
		//get the previous wall if exists, if doesn't get the last wall in list, if possible
		previousSelection = workspace.selectedWall != nil ? workspace.selectedWall : workspace.wallList.count>0 ? workspace.wallList.last : nil
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
		
		//maintain selection of wall based on weather this is called after exection or after unexection
		if(afterExecution){
			let index=workspace.wallList.index(of: wall)!
			wallListCollection.selectItems(at: [IndexPath(item: index, section: 0)],
			                               scrollPosition: NSCollectionViewScrollPosition.bottom)
			workspace.selectedWall=wall
		}else{
			if(previousSelection != nil){
				let index=workspace.wallList.index(of: previousSelection!)!
				wallListCollection.selectItems(at: [IndexPath(item: index, section: 0)],
				                               scrollPosition: NSCollectionViewScrollPosition.bottom)
				workspace.selectedWall=previousSelection
			}else{
				workspace.selectedWall=nil
			}
		}
		
    }
    
}
