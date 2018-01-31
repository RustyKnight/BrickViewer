//
//  MultiPointCommand+SceneKit.swift
//  BrickViewer
//
//  Created by Shane Whitehead on 31/1/18.
//  Copyright © 2018 Shane Whitehead. All rights reserved.
//

import Foundation
import LDrawKit
import SceneKit
import QuartzCore

extension MultiPointCommand {

  func vertices(inverted: Bool = false) -> [SCNVector3] {
    var p = points
    if inverted {
      p = p.reversed()
    }
    
    var verts: [SCNVector3] = []
    for point in p {
      verts.append(vector3(from: point))
    }
    return verts
  }

}
