//
//  MyBgView.swift
//  MemoryWall
//
//  Created by Nikhil Verma on 2/18/17.
//  Copyright © 2017 Nikhil Verma. All rights reserved.
//

import Cocoa

class MyBgView: NSView {

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
        NSColor.white.setFill();
        NSRectFill(dirtyRect);
        super.draw(dirtyRect);
    }
    
}
