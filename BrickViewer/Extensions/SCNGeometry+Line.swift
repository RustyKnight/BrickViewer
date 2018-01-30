//
//  SCNGeometry+Line.swift
//  BrickViewer
//
//  Created by Shane Whitehead on 29/1/18.
//  Copyright © 2018 Shane Whitehead. All rights reserved.
//

import Foundation
import SceneKit

extension SCNGeometry {
	class func lineFrom(vector vector1: SCNVector3, toVector vector2: SCNVector3) -> SCNGeometry {
		let indices: [Int32] = [0, 1]
		
		let source = SCNGeometrySource(vertices: [vector1, vector2])
		let element = SCNGeometryElement(indices: indices, primitiveType: .line)
		
		return SCNGeometry(sources: [source], elements: [element])		
	}
	
}
