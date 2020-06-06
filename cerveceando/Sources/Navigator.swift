//
//  Navigator.swift
//  cerveceando
//
//  Created by Rodrigo  on 06/06/2020.
//  Copyright © 2020 Rodrigo . All rights reserved.
//

import Foundation
import UIKit

enum Screens {
	case restaurants
}

class Navigator {
	let storyBoard: UIStoryboard?
	let navigationController: UINavigationController?
	
	init(storyBoard: UIStoryboard?, navigationController: UINavigationController?) {
		self.storyBoard = storyBoard
		self.navigationController = navigationController
	}
	
	public func navigateTo(screen: Screens) {
		
		switch screen {
		case .restaurants:
			let restaurantVC = storyBoard?.instantiateViewController(withIdentifier: "restaurants") as! RestaurantsViewController
			navigationController?.pushViewController(restaurantVC, animated: true)
			
		}
		
	}
	
}
