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
    
    func updateAffectedViews(){
        wallListCollection.reloadData()
    }
    
}
