//
//  Number+Rads.swift
//  LDrawKit
//
//  Created by Shane Whitehead on 13/3/18.
//  Copyright © 2018 Shane Whitehead. All rights reserved.
//

import Foundation

func sin(degrees: Double) -> Double {
	return __sinpi(degrees/180.0)
}

func sin(degrees: Float) -> Float {
	return Float(__sinpi(Double(degrees)/180.0))
}

func sin(degrees: CGFloat) -> CGFloat {
	return CGFloat(sin(degrees: degrees.native))
}

extension FloatingPoint {
	var degreesToRadians: Self {
		return self * .pi / 180
	}
	var radiansToDegrees: Self {
		return self * 180 / .pi
	}
}

