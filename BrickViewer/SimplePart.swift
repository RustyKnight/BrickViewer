//
//  SimplePart.swift
//  BrickViewer
//
//  Created by Shane Whitehead on 11/3/18.
//  Copyright © 2018 Shane Whitehead. All rights reserved.
//

import Foundation
import LDrawKit

let basicColor: LDColour = {
	let id = DefaultColourID(id: 1, description: "")
	let color = DefaultLDColour(legoID: [], id: id, value: "123", edge: "123", alpha: 255, luminance: nil, material: "none")
	return color
}()

class SimplePart: DefaultPart {
	
	override init() {
		super.init()
	}
	
}
