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
  
  func from(inverted: Bool = false) -> SCNVector3 {
    return vertices(inverted: inverted)[0]
  }
  
  func to(inverted: Bool = false) -> SCNVector3 {
    return vertices(inverted: inverted)[1]
  }
  
  func geometry(inverted: Bool = false) -> SCNGeometry {
    return SCNGeometry.lineFrom(vector: from(inverted: inverted), toVector: to(inverted: inverted))
  }
  
}
