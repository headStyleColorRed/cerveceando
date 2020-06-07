//
//  RestaurantsModel.swift
//  cerveceando
//
//  Created by Rodrigo  on 07/06/2020.
//  Copyright © 2020 Rodrigo . All rights reserved.
//

import Foundation
import Alamofire

class RestaurantsModel {
	
	typealias WebServiceResponse = ([String: Any]?, Error?) -> Void
	
	public func getRestaurantsData(url: String, completion: @escaping WebServiceResponse) {
		Alamofire.request(url).validate().responseJSON { response in
			
			switch response.result {
			case .success:
				guard let jsonDict = response.result.value as? [String: Any] else { return }
				completion(jsonDict, nil)
				break
			case .failure:
				completion(nil, response.error)
			}
			
		}
	}
	
}
