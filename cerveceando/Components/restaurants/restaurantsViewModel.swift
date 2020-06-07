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
	
	public func getRestaurantsData(completion: @escaping ([Restaurant]) -> Void) {
		let urlTo = "https://jsonplaceholder.typicode.com/todos/1"
		model.getRestaurantsData(url: urlTo) { (res, err) in
			guard let response = res else { return }
			print(response)
			completion(self.api_data.sorted(by: {$0.percentage ?? 0 > $1.percentage ?? 0}))
		}
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	private let api_data = [
		Restaurant(image: IconManager.shared.getIcon(icon: .restaurante1), name: "Nombre1", percentage: 75, phone: "962738128", rating: 1),
		Restaurant(image: IconManager.shared.getIcon(icon: .restaurante2), name: "Nombre2", percentage: 65, phone: "962738128", rating: 2),
		Restaurant(image: IconManager.shared.getIcon(icon: .restaurante3), name: "Nombre3", percentage: 35, phone: "962738128", rating: 3),
		Restaurant(image: IconManager.shared.getIcon(icon: .restaurante4), name: "Nombre2", percentage: 65, phone: "962738128", rating: 2),
		Restaurant(image: IconManager.shared.getIcon(icon: .restaurante5), name: "Nombre3", percentage: 35, phone: "962738128", rating: 4),
		Restaurant(image: IconManager.shared.getIcon(icon: .restaurante1), name: "Nombre2", percentage: 65, phone: "962738128", rating: 2),
		Restaurant(image: IconManager.shared.getIcon(icon: .restaurante2), name: "Nombre3", percentage: 35, phone: "962738128", rating: 2),
		Restaurant(image: IconManager.shared.getIcon(icon: .restaurante3), name: "Nombre2", percentage: 65, phone: "962738128", rating: 3),
		Restaurant(image: IconManager.shared.getIcon(icon: .restaurante4), name: "Nombre3", percentage: 35, phone: "962738128", rating: 2),
		Restaurant(image: IconManager.shared.getIcon(icon: .restaurante5), name: "Nombre2", percentage: 65, phone: "962738128", rating: 2),
		Restaurant(image: IconManager.shared.getIcon(icon: .restaurante1), name: "Nombre3", percentage: 35, phone: "962738128", rating: 1),
	]
	
}


