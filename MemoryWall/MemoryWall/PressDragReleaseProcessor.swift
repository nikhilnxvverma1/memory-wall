//
//  PressDragReleaseProcessor.swift
//  MemoryWall
//
//  Created by Nikhil Verma on 7/27/17.
//  Copyright © 2017 Nikhil Verma. All rights reserved.
//

import Foundation
import Cocoa


protocol PressDragReleaseProcessor {
	func mousePressed(with mouseEvent:NSEvent)
	func mouseDragged(with mouseEvent:NSEvent)
	func mouseReleased(with mouseEvent:NSEvent)
}
