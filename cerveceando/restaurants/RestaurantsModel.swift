//
//  RestaurantsModel.swift
//  cerveceando
//
//  Created by Rodrigo  on 07/06/2020.
//  Copyright © 2020 Rodrigo . All rights reserved.
//

import Foundation

class RestaurantsModel {
	private let api_data = [
		Restaurant(image: IconManager.shared.getIcon(icon: .restaurante1), name: "Nombre1", percentage: 75, phone: "962738128"),
		Restaurant(image: IconManager.shared.getIcon(icon: .restaurante2), name: "Nombre2", percentage: 65, phone: "962738128"),
		Restaurant(image: IconManager.shared.getIcon(icon: .restaurante3), name: "Nombre3", percentage: 35, phone: "962738128"),
		Restaurant(image: IconManager.shared.getIcon(icon: .restaurante4), name: "Nombre2", percentage: 65, phone: "962738128"),
		Restaurant(image: IconManager.shared.getIcon(icon: .restaurante5), name: "Nombre3", percentage: 35, phone: "962738128"),
		Restaurant(image: IconManager.shared.getIcon(icon: .restaurante1), name: "Nombre2", percentage: 65, phone: "962738128"),
		Restaurant(image: IconManager.shared.getIcon(icon: .restaurante2), name: "Nombre3", percentage: 35, phone: "962738128"),
		Restaurant(image: IconManager.shared.getIcon(icon: .restaurante3), name: "Nombre2", percentage: 65, phone: "962738128"),
		Restaurant(image: IconManager.shared.getIcon(icon: .restaurante4), name: "Nombre3", percentage: 35, phone: "962738128"),
		Restaurant(image: IconManager.shared.getIcon(icon: .restaurante5), name: "Nombre2", percentage: 65, phone: "962738128"),
		Restaurant(image: IconManager.shared.getIcon(icon: .restaurante1), name: "Nombre3", percentage: 35, phone: "962738128"),
	]
	
	public func getRestaurantsData() -> [Restaurant] {
		return api_data
	}
}
