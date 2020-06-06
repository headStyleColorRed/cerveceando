//
//  restaurantSectionCollectionViewCell.swift
//  cerveceando
//
//  Created by Rodrigo  on 06/06/2020.
//  Copyright © 2020 Rodrigo . All rights reserved.
//

import UIKit

class RestaurantSectionCollectionViewCell: UICollectionViewCell {
	@IBOutlet weak var label: UILabel!
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
	
	func setLabel(label: String) {
		self.label.text = label
	}

}
