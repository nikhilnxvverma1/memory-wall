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
	var delegate:WallCellDelegate!
	
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
		textField?.stringValue=wall.name!
        view.needsDisplay=true
    }
	
	func doubleClickedWallCell(){
		textField?.isEditable=true
		textField?.becomeFirstResponder()
	}
	
	@IBAction func finishedEditingWallName(_ sender: NSTextField) {
		if(sender==textField){
			textField?.isEditable=false
			textField?.resignFirstResponder()
			
			delegate.wallCell(self, newName: textField!.stringValue)
		}
	}
}

protocol WallCellDelegate {
	func wallCell(_ wallCell:WallCell, newName:String)
}
