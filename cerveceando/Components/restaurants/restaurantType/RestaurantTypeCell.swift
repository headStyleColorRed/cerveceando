//
//  CollectionViewCell.swift
//  cerveceando
//
//  Created by Rodrigo  on 06/06/2020.
//  Copyright © 2020 Rodrigo . All rights reserved.
//

import UIKit
class RestaurantTypeCell: UICollectionViewCell {
	@IBOutlet weak var label: UILabel!
	@IBOutlet weak var goldenLine: UIView!
	
	private var isActive = false
	
    override func awakeFromNib() {
        super.awakeFromNib()
		setUpUI()
    }

}

extension RestaurantTypeCell {
	
	private func setUpUI() {
		label.font = UIFont.boldSystemFont(ofSize: 18)
		
		
		goldenLine.backgroundColor = ColorManager.shared.getColor(color: .mustardYellow)
		isActive ? (goldenLine.isHidden = false) : (goldenLine.isHidden = true)
	}

}


// MARK: -	Setters
extension RestaurantTypeCell {
	
	func setLabel(label: String) {
		self.label.text = label
	}
	
	func setActivenes(active: Bool) {
		self.isActive = active
		setUpUI()
	}
}
