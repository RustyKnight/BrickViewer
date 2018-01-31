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
    return vector3(from: points[0])
  }
  
  var to: SCNVector3 {
    return vector3(from: points[1])
  }
  
  var geometry: SCNGeometry {
    return SCNGeometry.lineFrom(vector: from, toVector: to)
  }
  
}
