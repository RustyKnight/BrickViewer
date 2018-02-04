//
//  SubFileCommand+SceneKit.swift
//  BrickViewer
//
//  Created by Shane Whitehead on 4/2/18.
//  Copyright © 2018 Shane Whitehead. All rights reserved.
//

import Foundation
import LDrawKit
import SceneKit

extension Int {
	var cgFloat: CGFloat {
		return CGFloat(self)
	}
}

extension Double {
	var cgFloat: CGFloat {
		return CGFloat(self)
	}
}

extension SubFileCommand {
	var transformation: SCNMatrix4 {
		//
		//init(m11: Float, m12: Float, m13: Float, m14: Float, m21: Float, m22: Float, m23: Float, m24: Float, m31: Float, m32: Float, m33: Float, m34: Float, m41: Float, m42: Float, m43: Float, m44: Float)
		//			/ a d g 0 \   / a b c x \
		//			| b e h 0 |   | d e f y |
		//			| c f i 0 |   | g h i z |
		//			\ x y z 1 /   \ 0 0 0 1 /
//		return SCNMatrix4(m11: matrix[0].cgFloat, m12: matrix[1].cgFloat, m13: matrix[2].cgFloat, m14: location.x.cgFloat,
//											m21: matrix[3].cgFloat, m22: matrix[4].cgFloat, m23: matrix[5].cgFloat, m24: location.y.cgFloat,
//											m31: matrix[6].cgFloat, m32: matrix[7].cgFloat, m33: matrix[8].cgFloat, m34: location.z.cgFloat,
//											m41: 0, m42: 0, m43: 0, m44: 1)
		return SCNMatrix4(m11: matrix[0].cgFloat, m12: matrix[1].cgFloat, m13: matrix[2].cgFloat, m14: 0.cgFloat,
											m21: matrix[3].cgFloat, m22: matrix[4].cgFloat, m23: matrix[5].cgFloat, m24: 0.cgFloat,
											m31: matrix[6].cgFloat, m32: matrix[7].cgFloat, m33: matrix[8].cgFloat, m34: 0.cgFloat,
											m41: location.x.cgFloat, m42: location.y.cgFloat, m43: location.z.cgFloat, m44: 1)
		//			command.matrix
	}
}
