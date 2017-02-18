//
//  Workspace.swift
//  MemoryWall
//
//  Created by Nikhil Verma on 2/18/17.
//  Copyright © 2017 Nikhil Verma. All rights reserved.
//

import Cocoa

class Workspace: NSObject {
    var backend:BackendService;
    var renderer:RenderingStrategy;
    var history:[Command];
    var future:[Command];
    
    private var _managedObjectContext:NSManagedObjectContext!
    var managedObjectContext:NSManagedObjectContext{
        
        get{
            return _managedObjectContext;
        }
        
        set(moc){
            _managedObjectContext=moc;
            backend.managedObjectContext=moc;
        }
    }
    
    override init(){
        backend=BackendService();
        renderer=DumbRenderingStrategy();
        history=[Command]();
        future=[Command]();
    }
    
    func comit(command:Command,execute:Bool=false){
        if(execute){
            command.execute();
        }
        future.removeAll();
        history.append(command);
    }
    
    func undo(){
        if(!history.isEmpty){
            let lastCommand=history.removeLast();
            lastCommand.unExecute();
            future.append(lastCommand);
        }else{
            print("Undo stack is empty")
        }
    }
    
    func redo(){
        if(!future.isEmpty){
            let undidCommand=future.removeLast();
            undidCommand.execute();
            history.append(undidCommand);
        }else{
            print("Redo stack is empty");
        }
    }
    
}
