//
//  LineCommand+SceneKit.swift
//  BrickViewer
//
//  Created by Shane Whitehead on 31/1/18.
//  Copyright © 2018 Shane Whitehead. All rights reserved.
//

import Foundation
import LDrawKit
import SceneKit
import QuartzCore

extension LineCommand {
	
	var from: SCNVector3 {
		return vertices[0]
	}
	
	var to: SCNVector3 {
		return vertices[1]
	}
	
	func geometry(invertNext: Bool) -> SCNGeometry {
		var geo: SCNGeometry!
		if invertNext {
			geo = SCNGeometry.lineFrom(vector: to, toVector: from)
		} else {
    	geo = SCNGeometry.lineFrom(vector: from, toVector: to)
		}
		geo.firstMaterial = material
		return geo
  }
  
}
