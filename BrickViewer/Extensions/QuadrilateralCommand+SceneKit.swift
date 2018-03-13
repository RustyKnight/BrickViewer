//
//  QuadrilateralCommand+SceneKit.swift
//  BrickViewer
//
//  Created by Shane Whitehead on 31/1/18.
//  Copyright © 2018 Shane Whitehead. All rights reserved.
//

import Foundation
import LDrawKit
import SceneKit
import QuartzCore

extension QuadrilateralCommand {
  
	func geometry(invertNext: Bool) -> SCNGeometry {
		let verts = invertNext ? vertices.reversed() : vertices
    let vertexSource = SCNGeometrySource(vertices: verts)
    let indices: [Int32] = [4, 0, 1, 2, 3]
    let indexData = Data(bytes: indices, count: indices.count * MemoryLayout<Int32>.size)
    let element = SCNGeometryElement(data: indexData,
                                     primitiveType: .polygon,
                                     primitiveCount: 1,
                                     bytesPerIndex: MemoryLayout<Int32>.size)
    let geometry = SCNGeometry(sources: [vertexSource], elements: [element])
		geometry.firstMaterial = material
    return geometry
  }
}
