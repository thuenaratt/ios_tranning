//
//  UIColor+App.swift
//  Realestate
//
//  Created by Savet on 11/5/19.
//  Copyright © 2019 PassApp Technologies Co., Ltd. All rights reserved.
//

import UIKit.UIColor
import CoreGraphics

extension UIColor {
	
	static var inActiveButton: UIColor {
		return UIColor(hexString: "FDA178")
	}
	
	convenience init(hexString: String, alpha: CGFloat? = 1) {
		let scanner = Scanner(string: hexString)
		scanner.scanLocation = 0
		var rgbValue: UInt64 = 0
		scanner.scanHexInt64(&rgbValue)
		
		let r = (rgbValue & 0xff0000) >> 16
		let g = (rgbValue & 0xff00) >> 8
		let b = rgbValue & 0xff
		
		self.init(
			red: CGFloat(r) / 0xff,
			green: CGFloat(g) / 0xff,
			blue: CGFloat(b) / 0xff, alpha: alpha!
		)
	}
	
}
