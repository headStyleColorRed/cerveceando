//
//  restaurantsViewModel.swift
//  cerveceando
//
//  Created by Rodrigo  on 07/06/2020.
//  Copyright © 2020 Rodrigo . All rights reserved.
//

import Foundation

class RestaurantsViewModel {

	private let model = RestaurantsModel()
	private let restaurants = [Restaurant]()
	
	public func getRestaurantsData() -> [Restaurant] {
		let tempRestaurants = model.getRestaurantsData()
		
		return tempRestaurants.sorted(by: {$0.percentage ?? 0 > $1.percentage ?? 0})
		
	}
	
}

