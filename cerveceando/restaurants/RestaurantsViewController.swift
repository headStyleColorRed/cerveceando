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
	@IBOutlet weak var searchButton: UIButton!
	
	let viewModel = RestaurantsViewModel()
	let restaurantTypes = ["Cafeterías", "Bares", "Restaurantes"]
	var restaurants = [Restaurant()]
	var restaurantSection = RestaurantType.cafeteria
	
	override func viewDidLoad() {
		super.viewDidLoad()
		loadData()
		setUpRestaurantTypeCollectionView()
		setUpRestaurantSectionCollectionView()
		updateUi()
	}
	
	@IBAction func searchButtonAction(_ sender: Any) {
	}
}

// MARK: - Ui handler
extension RestaurantsViewController {
	func updateUi() {
		topTitle.font = UIFont.boldSystemFont(ofSize: 25)
		
		searchButton.setTitle("", for: .normal)
		searchButton.imageView?.image = IconManager.shared.getIcon(icon: .searchIcon)
		searchButton.layer.cornerRadius = searchButton.frame.height / 2
		searchButton.backgroundColor = ColorManager.shared.getColor(color: .MustardYellow)
	}
}

// MARK: - Private methods
extension RestaurantsViewController {
	
	private func loadData() {
		let data = viewModel.getRestaurantsData()
		
		restaurants = []
		switch restaurantSection {
		case .cafeteria:
			restaurants.append(data[0])
			restaurants.append(data[1])
			restaurants.append(data[2])
		case .bar:
			restaurants.append(data[3])
			restaurants.append(data[4])
			restaurants.append(data[5])
			restaurants.append(data[6])
			restaurants.append(data[7])
			restaurants.append(data[8])
			restaurants.append(data[9])
		case .restaurant:
			restaurants.append(data[5])
			restaurants.append(data[6])
			restaurants.append(data[7])
			restaurants.append(data[8])
			restaurants.append(data[9])
			restaurants.append(data[10])
		}
		
		restaurantSectionCollectionView.reloadData()
		restaurantSectionCollectionView.scrollToItem(at: IndexPath(index: 0), at: .top, animated: true)
	}
	
	private func manageTypeChange() {
		topTitle.text = restaurantTypes[restaurantSection.rawValue]
		loadData()
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
		
		let itemWidth: CGFloat = self.view.frame.width - 70
        let itemHeight: CGFloat = 120
        collectionBannerLayaout.itemSize = CGSize(width: itemWidth, height: itemHeight)
        collectionBannerLayaout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        collectionBannerLayaout.scrollDirection = .vertical
		collectionBannerLayaout.minimumLineSpacing = 30
        restaurantSectionCollectionView.collectionViewLayout = collectionBannerLayaout
	}
	
	
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		switch collectionView.tag {
		case 0:
			return restaurantTypes.count
		case 1:
			return restaurants.count
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
			
			cellSection.fillCell(data: restaurants[indexPath.row])
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
			manageTypeChange()
		default:
			break
		}
	}
	
}
