//
//  Icons.swift
//  cerveceando
//
//  Created by Rodrigo  on 06/06/2020.
//  Copyright © 2020 Rodrigo . All rights reserved.
//

import Foundation
import UIKit

enum Icons: String {
	case beerIcon = "beer_icon"
	case searchIcon = "search_icon"
	case restaurante1 = "restaurante1"
	case restaurante2 = "restaurante2"
	case restaurante3 = "restaurante3"
	case restaurante4 = "restaurante4"
	case restaurante5 = "restaurante5"
}

class IconManager {
	
	private init() {}
	static let shared = IconManager()
	
	func getIcon(icon: Icons) -> UIImage? {
		return UIImage(named: icon.rawValue)
	}
}
