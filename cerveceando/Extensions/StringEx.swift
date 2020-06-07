//
//  Strings.swift
//  cerveceando
//
//  Created by Rodrigo  on 07/06/2020.
//  Copyright © 2020 Rodrigo . All rights reserved.
//

import Foundation
import UIKit

extension String {
	func parsePhone() -> String {
		var tempString = self
		tempString.insert(" ", at: tempString.index(tempString.startIndex, offsetBy: 3))
		tempString.insert(" ", at: tempString.index(tempString.startIndex, offsetBy: 6))
		tempString.insert(" ", at: tempString.index(tempString.startIndex, offsetBy: 9))
		return tempString
	}
}
