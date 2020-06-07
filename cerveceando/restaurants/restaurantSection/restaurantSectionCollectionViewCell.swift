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
	
	var originalPercentage: Int = 0
	
	override func awakeFromNib() {
		super.awakeFromNib()
		layoutView()
	}
	
	func fillCell(data: Restaurant) {
		guard let percentage = data.percentage, let name = data.name, let phone = data.phone, let image = data.image else { return }
		
		self.restaurantImage.image = image
		self.restaurantName.text = name
		self.retaurantPhone.text = phone
		self.restaurantPercentage.text = String(percentage) + "%"
		self.originalPercentage = percentage
		
		setPercentageColor(percentage: percentage)
	}
	
}


extension RestaurantSectionCollectionViewCell {
	
	private func setPercentageColor(percentage: Int) {
		if originalPercentage >= 70 {
			restaurantPercentage.textColor = .green
		} else if originalPercentage < 70 && originalPercentage > 45  {
			restaurantPercentage.textColor = ColorManager.shared.getColor(color: .MustardYellow)
		} else if originalPercentage <= 45 {
			restaurantPercentage.textColor = .red
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
