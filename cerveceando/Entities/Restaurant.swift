//
//  Restaurant.swift
//  cerveceando
//
//  Created by Rodrigo  on 07/06/2020.
//  Copyright © 2020 Rodrigo . All rights reserved.
//

import Foundation
import UIKit

class Restaurant {
	var image: UIImage?
	var name: String?
	var percentage: Int?
	var phone: String?
	var rating: Int?
	
	init() {}
	
	init(image: UIImage?, name: String?, percentage: Int?, phone: String?, rating: Int?) {
		self.image = image
		self.name = name
		self.percentage = percentage
		self.phone = phone
		self.rating = rating
	}
}
