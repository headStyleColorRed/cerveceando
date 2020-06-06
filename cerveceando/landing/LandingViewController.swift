//
//  Landing.swift
//  cerveceando
//
//  Created by Rodrigo  on 06/06/2020.
//  Copyright © 2020 Rodrigo . All rights reserved.
//

import UIKit

class LandingViewController: UIViewController {
	@IBOutlet weak var logoImage: UIImageView!
	@IBOutlet weak var startButton: UIButton!
	
	var navigator: Navigator?
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
		navigator = Navigator(storyBoard: self.storyboard, navigationController: self.navigationController)
		setUpUI()
		
		
    }
	
	@IBAction func startButtonAction(_ sender: Any) {
		navigator?.navigateTo(screen: .restaurants)
	}
	
}

extension LandingViewController {
	func setUpUI() {
		// Image
		logoImage.image = IconManager.shared.getIcon(icon: .beerIcon)
		startButton.setTitle(StringManager.shared.getString(string: .findATable), for: .normal)
		
		// Button
		startButton.backgroundColor = ColorManager.shared.getColor(color: .MustardYellow)
		startButton.layer.cornerRadius = startButton.frame.height / 2
		startButton.tintColor = .white
		startButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
		
	}
}
