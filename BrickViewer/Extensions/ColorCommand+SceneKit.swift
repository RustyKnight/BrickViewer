//
//  ColorCommand+SceneKit.swift
//  BrickViewer
//
//  Created by Shane Whitehead on 4/2/18.
//  Copyright © 2018 Shane Whitehead. All rights reserved.
//

import Foundation
import LDrawKit
import SceneKit


var colors: [NSColor] = [
	NSColor.blue,
	NSColor.brown,
	NSColor.cyan,
	NSColor.green,
	NSColor.magenta,
	NSColor.orange,
	NSColor.purple,
	NSColor.red,
	NSColor.yellow,
]

extension ColorCommand {
	
	var material: SCNMaterial? {
//		guard id != 16 && id != 24 else {
//			return
//		}
		let index = Int(arc4random_uniform(UInt32(colors.count)))
		let material = SCNMaterial()
		material.diffuse.contents = colors[index]
		return material
	}
	
}

extension NSColor {
	static func color(fromHash hex6: String) -> NSColor {
		let hex = Int(String(hex6.dropFirst()), radix: 16)!
		return NSColor(red:   CGFloat( (hex & 0xFF0000) >> 16 ) / 255.0,
									 green: CGFloat( (hex & 0x00FF00) >> 8 ) / 255.0,
									 blue:  CGFloat( (hex & 0x0000FF) >> 0 ) / 255.0,
									 alpha: CGFloat(1.0))
	}
}
