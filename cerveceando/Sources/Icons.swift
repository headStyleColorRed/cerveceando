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
}

class IconManager {
	
	private init() {}
	static let shared = IconManager()
	
	func getIcon(icon: Icons) -> UIImage? {
		return UIImage(named: icon.rawValue)
	}
}
