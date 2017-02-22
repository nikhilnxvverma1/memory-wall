//
//  Command.swift
//  MemoryWall
//
//  Created by Nikhil Verma on 2/18/17.
//  Copyright © 2017 Nikhil Verma. All rights reserved.
//

import Cocoa

/**
An actionable operation performed by the user that can be undone or redone at will
*/
protocol Command{
	/** The forward(a.k.a redo) exection of this command. */
    func execute()
	/** The bacward(a.k.a undo) process of this command */
    func unExecute()
	/** User friendly name that identifies this command */
    func getName()->String
	/** 
	A responsibility of the command to update the UI after its executed or un executed
	- parameter afterExecution: true if called after forward execution(redo),
	otherwise false if called after unexecution(undo)
	*/
    func updateAffectedViews(afterExecution:Bool)
}
