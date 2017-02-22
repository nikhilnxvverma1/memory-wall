//
//  WallVM.swift
//  MemoryWall
//
//  Created by Nikhil Verma on 2/19/17.
//  Copyright © 2017 Nikhil Verma. All rights reserved.
//

import Cocoa

class Wall: NSObject {
    
    var name:String?
    var thumbnail:NSImage?
    var creationTimestamp:NSDate=NSDate()
    var anchor:CGPoint?
    var start:CGPoint?
    var end:CGPoint?
    var renderingStrategy:Int16?
	var backgroundColor:NSColor?
	var foregroundColor:NSColor?
	
    
    private var _wallModel:WallModel?
	
    var wallModel:WallModel?{
        get{
            return _wallModel!
        }
        
        set{
            _wallModel=newValue
            copyAttributesFrom(that: newValue)
        }
    }
    
    override init(){
		super.init()
		self.setDefaults()
    }
	
    /**
     Copies attributes from the supplied model (only if its not nil).
     - parameter that: the model to copy from. If this is nil, then this method does not copy
     */
    func copyAttributesFrom(that:WallModel?){
        if(that==nil){
            return;
        }
        name=that!.name
        creationTimestamp=that!.creationTimestamp!
        anchor=CGPoint(x: CGFloat(that!.anchorX), y: CGFloat(that!.anchorY))
		start=CGPoint(x: CGFloat(that!.startX), y: CGFloat(that!.startY))
		end=CGPoint(x: CGFloat(that!.endX), y: CGFloat(that!.endY))
		renderingStrategy=that!.renderingStrategy
		if let hashcode=that!.foregroundColorHashCode{
			foregroundColor=NSColor(hashcode: hashcode)
		}
		
		if let hashcode=that!.backgroundColorHashCode{
			backgroundColor=NSColor(hashcode: hashcode)
		}
		
		
    }
	
	/**
	Sets default values for all attributes(except creationTimestamp) in this View model.
	*/
	func setDefaults(){
		name="Untitled"
		thumbnail=NSImage(named:"NSFolderSmart")
		foregroundColor=NSColor(hashcode: "#000000")
		backgroundColor=NSColor(hashcode: "#FFFFFF")
		creationTimestamp=NSDate()
		anchor=CGPoint(x: 0.5, y: 0.5)
		start=CGPoint(x: 0, y: 0)
		end=CGPoint(x: 1, y: 1)
		renderingStrategy=1
	}
	
	
	/**
	Creates a managed object having the same values as this object and sets that as the current wall model
	- parameter managedObjectContext: the context the entity is associated with and will be inserted to
	*/
	func persist(_ managedObjectContext:NSManagedObjectContext){
		
		let wallModel=NSEntityDescription.insertNewObject(forEntityName: "WallModel", into: managedObjectContext) as! WallModel
		wallModel.name=name
		wallModel.creationTimestamp=NSDate()
		wallModel.foregroundColorHashCode=foregroundColor?.hashcode()
		wallModel.backgroundColorHashCode=backgroundColor?.hashcode()
		wallModel.anchorX=Float((anchor?.x)!)
		wallModel.anchorY=Float((anchor?.y)!)
		wallModel.startX=Float((start?.x)!)
		wallModel.startY=Float((start?.y)!)
		wallModel.endX=Float((end?.y)!)
		wallModel.endY=Float((end?.y)!)
		wallModel.renderingStrategy=renderingStrategy!
		self.wallModel=wallModel
	}
	
	/**
	Removes the model from the managed object context and sets the wall model to nil
	- parameter managedObjectContext: the context that contains the model
	*/
	func unpersist(_ managedObjectContext:NSManagedObjectContext){
		managedObjectContext.delete(wallModel!)
		self.wallModel=nil
	}
}
