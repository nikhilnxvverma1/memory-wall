//
//  WallListController.swift
//  MemoryWall
//
//  Created by Nikhil Verma on 2/18/17.
//  Copyright © 2017 Nikhil Verma. All rights reserved.
//

import Cocoa

class WallListController: NSViewController {

    var workspace:Workspace!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        print("wall list controller created");
    }
    
    func receiveWorkspace(_ workspace:Workspace){
        self.workspace=workspace;
    }
    
}
