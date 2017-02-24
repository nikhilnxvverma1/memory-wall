//
//  DeleteWall.swift
//  MemoryWall
//
//  Created by Nikhil Verma on 2/18/17.
//  Copyright © 2017 Nikhil Verma. All rights reserved.
//

import Cocoa

class DeleteWall: Command {
	
	private var wall:Wall
	private var wallListCollection:NSCollectionView
	private var workspace:Workspace
	private var nextSelection:Wall?
	private var nextSelectionLiesBefore:Bool=true
	
	init(_ wall:Wall,_ wallListCollection:NSCollectionView,_ workspace:Workspace){
		self.wall=wall
		self.wallListCollection=wallListCollection
		self.workspace=workspace
		
		mostLikelyNextSelection()
	}
	
	/** Gets the wall before this wall in list, if this is the first, get the wall after, if this is the only wall next selection is nil */
	func mostLikelyNextSelection(){
		let index=workspace.wallList.index(of: wall)!
		if(index>0){
			nextSelectionLiesBefore=true
			nextSelection = workspace.wallList[index-1]
		}else if(index<workspace.wallList.count-1){
			nextSelectionLiesBefore=false
			nextSelection = workspace.wallList[index+1]
		}else{
			nextSelectionLiesBefore=false
			nextSelection=nil
		}
	}
	
	func execute(){
		wall.unpersist(workspace.managedObjectContext)
		workspace.wallList.remove(at: workspace.wallList.index(of: wall)!)
	}
	
	func unExecute(){
		wall.persist(workspace.managedObjectContext)
		if(nextSelection != nil){
			let index=workspace.wallList.index(of: nextSelection!)!
			workspace.wallList.insert(wall, at: nextSelectionLiesBefore ? index+1 : index)
		}else{
			workspace.wallList.append(wall)
		}
	}
	
	
	
    func getName()->String{
        return "Delete wall";
    }
    
    func updateAffectedViews(afterExecution:Bool){
		wallListCollection.reloadData()
		
		//maintain selection of wall based on weather this is called after exection or after unexection
		if(afterExecution){
			if(nextSelection != nil){
				let index=workspace.wallList.index(of: nextSelection!)!
				wallListCollection.selectItems(at: [IndexPath(item: index, section: 0)],
				                               scrollPosition: NSCollectionViewScrollPosition.bottom)
				workspace.selectedWall=nextSelection
			}else{
				workspace.selectedWall=nil
			}
		}else{
			let index=workspace.wallList.index(of: wall)!
			wallListCollection.selectItems(at: [IndexPath(item: index, section: 0)],
			                               scrollPosition: NSCollectionViewScrollPosition.bottom)
			workspace.selectedWall=wall
		}
    }
    
}

