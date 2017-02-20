//
//  WallCell.swift
//  MemoryWall
//
//  Created by Nikhil Verma on 2/18/17.
//  Copyright © 2017 Nikhil Verma. All rights reserved.
//

import Cocoa

class WallCell: NSCollectionViewItem {

    private var _wall:Wall!
    
    var wall:Wall{
        get{
            return _wall;
        }
        set(value){
            _wall=value;
            updateView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    private func updateView(){
        let name=view.viewWithTag(1) as! NSTextField
//        name.stringValue=wall.name!
        view.needsDisplay=true
    }
}
