//
//  colors.swift
//  cerveceando
//
//  Created by Rodrigo  on 06/06/2020.
//  Copyright © 2020 Rodrigo . All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

enum Colors: String {
	
	case darkBackground = "dark_gray"
	case mustardYellow = "mustard_yellow"
	case darkGreen = "dark_green"
	case darkRed = "dark_red"
}

class ColorManager {
	
	private init() {}
	static let shared = ColorManager()
	
	func getColor(color: Colors) -> UIColor? {
		return UIColor(named: color.rawValue)
	}
}
