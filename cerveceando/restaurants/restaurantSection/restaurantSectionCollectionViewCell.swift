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
    
    override func awakeFromNib() {
        super.awakeFromNib()
		
		
		
		    let radius: CGFloat = 10
		contentView.layer.cornerRadius = radius
		contentView.layer.borderWidth = 1
		contentView.layer.borderColor = UIColor.clear.cgColor
		contentView.layer.masksToBounds = true

		layer.shadowColor = UIColor.black.cgColor
		layer.shadowOffset = CGSize(width: 0, height: 1.0)
		layer.shadowRadius = 2.0
		layer.shadowOpacity = 0.5
		layer.masksToBounds = false
		layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: radius).cgPath
		layer.cornerRadius = radius
		
        
    }
	
	func fillCell(data: Restaurant) {
		guard let percentage = data.percentage, let name = data.name, let phone = data.phone, let image = data.image else { return }
		
		self.restaurantImage.image = image
		self.restaurantName.text = name
		self.retaurantPhone.text = phone
		self.restaurantPercentage.text = String(percentage) + "%"
	}

}
