//
//  restaurantSectionCollectionViewCell.swift
//  cerveceando
//
//  Created by Rodrigo  on 06/06/2020.
//  Copyright © 2020 Rodrigo . All rights reserved.
//

import UIKit

class RestaurantSectionCollectionViewCell: UICollectionViewCell {
	@IBOutlet weak var restaurantImage: UIImageView!
	@IBOutlet weak var restaurantName: UILabel!
	@IBOutlet weak var restaurantPercentage: UILabel!
	@IBOutlet weak var retaurantPhone: UILabel!
	@IBOutlet weak var containerView: UIView!
	@IBOutlet weak var ratingStackview: UIStackView!
	
	@IBOutlet weak var chairOne: UIImageView!
	@IBOutlet weak var chairTwo: UIImageView!
	@IBOutlet weak var chairThree: UIImageView!
	@IBOutlet weak var chairFour: UIImageView!
	@IBOutlet weak var chairFive: UIImageView!
	
	
	var originalPercentage: Int = 0
	
	override func awakeFromNib() {
		super.awakeFromNib()
		layoutView()
		setUpUi()
	}
	
	func fillCell(data: Restaurant) {
		guard let percentage = data.percentage, let name = data.name, let phone = data.phone, let image = data.image, let rating = data.rating else { return }
		
		self.restaurantImage.image = image
		self.restaurantName.text = name
		self.retaurantPhone.text = phone.parsePhone()
		self.restaurantPercentage.text = String(percentage) + "%"
		self.originalPercentage = percentage
		
		setPercentageColor(percentage: percentage)
		showRatingChairs(rating: rating)
	}
	
}


extension RestaurantSectionCollectionViewCell {
	
	private func setUpUi() {
		chairOne.isHidden = true
		chairTwo.isHidden = true
		chairThree.isHidden = true
		chairFour.isHidden = true
		chairFive.isHidden = true
		
		restaurantPercentage.font = UIFont.boldSystemFont(ofSize: 12)
	}
	
	private func showRatingChairs(rating: Int) {
		switch rating {
		case 1:
			chairOne.isHidden = false
		case 2:
			chairOne.isHidden = false
			chairTwo.isHidden = false
		case 3:
			chairOne.isHidden = false
			chairTwo.isHidden = false
			chairThree.isHidden = false
		case 4:
			chairOne.isHidden = false
			chairTwo.isHidden = false
			chairThree.isHidden = false
			chairFour.isHidden = false
		case 5:
			chairOne.isHidden = false
			chairTwo.isHidden = false
			chairThree.isHidden = false
			chairFour.isHidden = false
			chairFive.isHidden = false
		default:
			break
		}
	}
	
	private func setPercentageColor(percentage: Int) {
		if originalPercentage >= 70 {
			restaurantPercentage.textColor = ColorManager.shared.getColor(color: .darkGreen)
		} else if originalPercentage < 70 && originalPercentage > 45  {
			restaurantPercentage.textColor = ColorManager.shared.getColor(color: .mustardYellow)
		} else if originalPercentage <= 45 {
			restaurantPercentage.textColor = ColorManager.shared.getColor(color: .darkRed)
		}
	}
	
	
	private func layoutView() {
		
		// set the shadow of the view's layer
		layer.backgroundColor = UIColor.clear.cgColor
		layer.shadowColor = UIColor.black.cgColor
		layer.shadowOffset = CGSize(width: 2.0, height: 1.0)
		layer.shadowOpacity = 0.2
		layer.shadowRadius = 7.0
		
		containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -10).isActive = true
		containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
		containerView.topAnchor.constraint(equalTo: topAnchor, constant: -10).isActive = true
		containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
		
	}
}
