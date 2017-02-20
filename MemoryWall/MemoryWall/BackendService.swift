//
//  BackendService.swift
//  MemoryWall
//
//  Created by Nikhil Verma on 2/18/17.
//  Copyright © 2017 Nikhil Verma. All rights reserved.
//

import Cocoa

class BackendService: NSObject {
    var managedObjectContext:NSManagedObjectContext!;
    
    func createNewWall(name:String)->Wall{
        let wall:Wall!
        wall=NSEntityDescription.insertNewObject(forEntityName: "Wall", into: managedObjectContext) as! Wall
        
        wall.creationTimestamp=NSDate()
        wall.foregroundColorHashCode="#FFFFFF"
        wall.backgroundColorHashCode="#000000"
        wall.anchorX=0.5
        wall.anchorY=0.5
        wall.startX=0
        wall.startY=0
        wall.endX=1
        wall.endY=1
        wall.name=name
        wall.renderingStrategy=1
        
        return wall
    }
    
    func insertEntityInContext(unmanagedObject:NSManagedObject){
        managedObjectContext.insert(unmanagedObject)
    }
    
    func removeEntityFromContext(managedObject:NSManagedObject){
        managedObjectContext.delete(managedObject);
    }
    
    func retrieveAllWalls()->[Wall]{
        
        let fetchRequest=NSFetchRequest<NSFetchRequestResult>(entityName:"Wall")
        let fetchedWalls:[Wall]!
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "creationTimestamp", ascending: true)]
        do {
            fetchedWalls=try managedObjectContext.fetch(fetchRequest) as! [Wall]
        } catch {
            fatalError("Failed to fetch walls: \(error)")
        }
        
        return fetchedWalls
    }
}
