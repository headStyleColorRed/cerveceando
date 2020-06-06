//
//  Strings.swift
//  cerveceando
//
//  Created by Rodrigo  on 06/06/2020.
//  Copyright © 2020 Rodrigo . All rights reserved.
//

import Foundation


enum Strings: String {
	case findATable = "Encuentra una mesa..."

}

class StringManager {
	
	private init() {}
	static let shared = StringManager()
	
	func getString(string: Strings) -> String {
		return string.rawValue
	}
}
