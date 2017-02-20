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
    private var afterFirstInsert=false;
    
    init(workspace:Workspace,name:String,wallListCollection:NSCollectionView){
        self.workspace=workspace;
        wall=workspace.backend.createNewWall(name: name)
        self.wallListCollection=wallListCollection
        afterFirstInsert=false
    }
    
    func execute(){
        
        if afterFirstInsert{
            workspace.backend.insertEntityInContext(unmanagedObject: wall)
        }
        afterFirstInsert=true
    }
    
    func unExecute(){
        workspace.backend.removeEntityFromContext(managedObject: wall)
    }
    
    func getName()->String{
        return "Create wall";
    }
    
    func updateAffectedViews(){
        wallListCollection.reloadData()
    }
    
}
