//
//  WallCell.swift
//  MemoryWall
//
//  Created by Nikhil Verma on 2/18/17.
//  Copyright © 2017 Nikhil Verma. All rights reserved.
//

import Cocoa

class WallCell: NSCollectionViewItem,WallCellViewDelegate {

    private var _wall:Wall!
	
	override var isSelected: Bool{
		didSet{
			if(_wall != nil){// on creating a wall and selecting at the same time, this property will be nil
				updateView()//highlighting should be handled inside draw rect method
			}
			
		}
	}
    
    var wall:Wall{
        get{
            return _wall;
        }
        set{
            _wall=newValue;
            updateView()
        }
    }
	
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
		let wallCellView=view as! WallCellView
		wallCellView.delegate=self
    }
	
	/**
	Updates the informational attributes of the view such as thumbnail and name
	*/
    private func updateView(){
		
		imageView?.image=wall.thumbnail
		if(isSelected){
			textField?.stringValue="selected"
		}else{
			textField?.stringValue=wall.name!
		}
		
        view.needsDisplay=true
    }
	
	func doubleClickedWallCell(){
		print("Wall cell double clicked")
	}
}
