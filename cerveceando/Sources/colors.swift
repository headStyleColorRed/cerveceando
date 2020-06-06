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
	
	case darkBackground = "Dark_background"
	case MustardYellow = "Mustard"
}

class ColorManager {
	
	private init() {}
	static let shared = ColorManager()
	
	func getIcon(color: Colors) -> Color {
		return Color(color.rawValue)
	}
}
