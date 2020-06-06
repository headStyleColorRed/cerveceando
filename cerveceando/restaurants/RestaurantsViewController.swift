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
	@IBOutlet weak var restaurantSectionCollectionView: UICollectionView!
	
	let restaurantTypes = ["Cafeterías", "Bares", "Restaurantes"]
	var restaurantSection = RestaurantType.cafeteria
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setUpRestaurantTypeCollectionView()
		setUpRestaurantSectionCollectionView()
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
		topTitle.text = restaurantTypes[restaurantSection.rawValue]
	}
	
	private func setRestaurantType(index: Int) {
		switch index {
		case 0:
			restaurantSection = .cafeteria
		case 1:
			restaurantSection = .bar
		case 2:
			restaurantSection = .restaurant
		default:
			restaurantSection = .cafeteria
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
		collectionBannerLayaout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 0)
		collectionBannerLayaout.scrollDirection = .horizontal
		
		restaurantTypeCollectionView.collectionViewLayout = collectionBannerLayaout
	}
	
	private func setUpRestaurantSectionCollectionView() {
		restaurantSectionCollectionView.delegate = self
		restaurantSectionCollectionView.dataSource = self
		
		let restaurantTypeNib = UINib(nibName: "restaurantSectionCollectionViewCell", bundle: nil)
		restaurantSectionCollectionView.register(restaurantTypeNib, forCellWithReuseIdentifier: "restaurantSectionCell")
		
		let collectionBannerLayaout = UICollectionViewFlowLayout()
		
		let itemWidth: CGFloat = self.view.frame.width
		let itemHeight: CGFloat = self.view.frame.height
		collectionBannerLayaout.itemSize = CGSize(width: itemWidth, height: itemHeight)
		collectionBannerLayaout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
		collectionBannerLayaout.scrollDirection = .horizontal
		restaurantSectionCollectionView.collectionViewLayout = collectionBannerLayaout
	}
	
	
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		switch collectionView.tag {
		case 0:
			return restaurantTypes.count
		case 1:
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
			
			if indexPath.row == restaurantSection.rawValue { cellType.setActivenes(active: true) }
			
			return cellType
		case 1:
			let cellSection = collectionView.dequeueReusableCell(withReuseIdentifier: "restaurantSectionCell", for: indexPath) as! RestaurantSectionCollectionViewCell
			cellSection.setLabel(label: restaurantTypes[indexPath.item])
			
			return cellSection
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
			restaurantSectionCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
			manageTypeChange()
		default:
			break
		}
	}
	
}
