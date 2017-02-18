//
//  Command.swift
//  MemoryWall
//
//  Created by Nikhil Verma on 2/18/17.
//  Copyright © 2017 Nikhil Verma. All rights reserved.
//

import Cocoa

protocol Command{
    func execute();
    func unExecute();
    func getName()->String;
}
