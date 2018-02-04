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

	var vertices: [SCNVector3] {
		return points.map{ vector3(from: $0) }
  }

}
