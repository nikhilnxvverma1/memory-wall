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
        
    }
    
    
    //Collection view Data source
    
    func numberOfSections(in collectionView: NSCollectionView) -> Int{
        return 1
    }
    
    func collectionView(_ collectionView: NSCollectionView,
                        numberOfItemsInSection section: Int) -> Int{
        return 10
    }
    
    func collectionView(_ collectionView: NSCollectionView,
                        itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem{
        return wallListCollection.makeItem(withIdentifier: "WallCell", for: indexPath)
    }
    
//    func collectionView(_ collectionView: NSCollectionView,
//                                 viewForSupplementaryElementOfKind kind: String,
//                                 at indexPath: IndexPath) -> NSView{
//        return nil
//    }

}
