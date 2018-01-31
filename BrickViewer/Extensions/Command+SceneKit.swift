//
//  Command+SceneKit.swift
//  BrickViewer
//
//  Created by Shane Whitehead on 31/1/18.
//  Copyright © 2018 Shane Whitehead. All rights reserved.
//

import Foundation
import LDrawKit
import SceneKit

extension Command {
  
  func vector3(from point: Point3D) -> SCNVector3 {
    return SCNVector3Make(CGFloat(point.x), CGFloat(point.y), CGFloat(point.z))
  }
  
}
