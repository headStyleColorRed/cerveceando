//
//  RestaurantsViewController.swift
//  cerveceando
//
//  Created by Rodrigo  on 06/06/2020.
//  Copyright © 2020 Rodrigo . All rights reserved.
//

import UIKit

enum RestaurantType: Int {
	case cafeteria
	case bar
	case restaurant
}

class RestaurantsViewController: UIViewController {
	@IBOutlet weak var topTitle: UILabel!
	@IBOutlet weak var restaurantTypeCollectionView: UICollectionView!
	
	let restaurantTypes = ["Cafeterías", "Bares", "Restaurantes"]
	var restaurantTypeSelected = RestaurantType.cafeteria
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setUpRestaurantTypeCollectionView()
		updateUi()
	}
	
}

// MARK: - Ui handler
extension RestaurantsViewController {
	func updateUi() {
		topTitle.font = UIFont.boldSystemFont(ofSize: 25)
	}
}

// MARK: - Private methods
extension RestaurantsViewController {
	
	private func manageTypeChange() {
		topTitle.text = restaurantTypes[restaurantTypeSelected.rawValue]
	}
	
	private func setRestaurantType(index: Int) {
		switch index {
		case 0:
			restaurantTypeSelected = .cafeteria
		case 1:
			restaurantTypeSelected = .bar
		case 2:
			restaurantTypeSelected = .restaurant
		default:
			restaurantTypeSelected = .cafeteria
		}
	}
}

// MARK: - CollectionView Delegate
extension RestaurantsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
	
	private func setUpRestaurantTypeCollectionView() {
		restaurantTypeCollectionView.delegate = self
		restaurantTypeCollectionView.dataSource = self
		
		let restaurantTypeNib = UINib(nibName: "RestaurantTypeCell", bundle: nil)
		restaurantTypeCollectionView.register(restaurantTypeNib, forCellWithReuseIdentifier: "restaurantTypeCell")
		
		let collectionBannerLayaout = UICollectionViewFlowLayout()
		
		let itemWidth: CGFloat = self.view.frame.width / 3
		let itemHeight: CGFloat = 50
		collectionBannerLayaout.itemSize = CGSize(width: itemWidth, height: itemHeight)
		collectionBannerLayaout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 0, right: 0)
		collectionBannerLayaout.scrollDirection = .horizontal
		restaurantTypeCollectionView.collectionViewLayout = collectionBannerLayaout
	}
	
	
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		switch collectionView.tag {
		case 0:
			return restaurantTypes.count
		default:
			return 0
		}
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		switch collectionView.tag {
		case 0:
			let cellType = collectionView.dequeueReusableCell(withReuseIdentifier: "restaurantTypeCell", for: indexPath) as! RestaurantTypeCell
			cellType.setLabel(label: restaurantTypes[indexPath.item])
			cellType.tag = indexPath.row
			cellType.setActivenes(active: false)
			
			if indexPath.row == restaurantTypeSelected.rawValue { cellType.setActivenes(active: true) }
			
			return cellType
		default:
			break
		}
		return UICollectionViewCell()
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		switch collectionView.tag {
		case 0:
			collectionView.scrollToItem(at: indexPath, at: .right, animated: true)
			setRestaurantType(index: indexPath.row)
			restaurantTypeCollectionView.reloadData()
			manageTypeChange()
		default:
			break
		}
	}
	
}
