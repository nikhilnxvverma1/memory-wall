//
//  RenderingStrategy.swift
//  MemoryWall
//
//  Created by Nikhil Verma on 2/18/17.
//  Copyright © 2017 Nikhil Verma. All rights reserved.
//

import Cocoa

protocol RenderingStrategy {
    func renderToView(wall:Wall);
}

class DumbRenderingStrategy : RenderingStrategy{
    func renderToView(wall:Wall) {
        print("Dummy rendering to view");
    }
}
