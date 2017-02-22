//
//  WallListController.swift
//  MemoryWall
//
//  Created by Nikhil Verma on 2/18/17.
//  Copyright © 2017 Nikhil Verma. All rights reserved.
//

import Cocoa

class WallListController: NSViewController,NSCollectionViewDelegate,NSCollectionViewDataSource {

    var workspace:Workspace!;
    
    @IBOutlet weak var wallListCollection: NSCollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        let wallCell=NSNib(nibNamed: "WallCell", bundle: nil);
        wallListCollection.register(wallCell, forItemWithIdentifier: "WallCell");
        wallListCollection.delegate=self
        wallListCollection.dataSource=self
    }
    
    func receiveWorkspace(_ workspace:Workspace){
        self.workspace=workspace;
    }
    
    @IBAction func createWall(_ sender: Any) {
        let name="\(arc4random())Gen"
        let createWall=CreateWall(workspace:workspace,name:name,wallListCollection:wallListCollection)
        workspace.comit(command: createWall,execute: true)
    }
	
    
    //MARK: Wall List Data source
    
    func numberOfSections(in collectionView: NSCollectionView) -> Int{
        return 1
    }
    
    func collectionView(_ collectionView: NSCollectionView,
                        numberOfItemsInSection section: Int) -> Int{
        return workspace.wallList.count
    }
    
    func collectionView(_ collectionView: NSCollectionView,
                        itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem{
        let wallCell = wallListCollection.makeItem(withIdentifier: "WallCell", for: indexPath) as! WallCell
        wallCell.wall=workspace.wallList[indexPath.item]
        return wallCell
    }
	
//    func collectionView(_ collectionView: NSCollectionView,
//                                 viewForSupplementaryElementOfKind kind: String,
//                                 at indexPath: IndexPath) -> NSView{
//        return nil
//    }

	//MARK: Wall List Delegate
	
	func collectionView(_ collectionView: NSCollectionView,
	                    didSelectItemsAt indexPaths: Set<IndexPath>){
		workspace.selectedWall=workspace.wallList[indexPaths.first!.item]
		print("Item got selected \(indexPaths)")
	}
}
