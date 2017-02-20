//
//  Extensions.swift
//  MemoryWall
//
//  Created by Nikhil Verma on 2/19/17.
//  Copyright © 2017 Nikhil Verma. All rights reserved.
//

import Cocoa


extension NSColor {
	public convenience init?(hashcode: String) {
		let r, g, b, a: CGFloat
		
		if hashcode.hasPrefix("#") {
			let start = hashcode.index(hashcode.startIndex, offsetBy: 1)
			let hexColor = hashcode.substring(from: start)
			
			if hexColor.characters.count == 8 {
				let scanner = Scanner(string: hexColor)
				var hexNumber: UInt64 = 0
				
				if scanner.scanHexInt64(&hexNumber) {
					r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
					g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
					b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
					a = CGFloat(hexNumber & 0x000000ff) / 255
					
					self.init(red: r, green: g, blue: b, alpha: a)
					return
				}
			}
		}
		
		return nil
	}
	
	/**
	Returns the color hascode equivalent which is prefixed with a #
	*/
	public func hashcode()->String{
		return "#123456"//TODO
	}
}
