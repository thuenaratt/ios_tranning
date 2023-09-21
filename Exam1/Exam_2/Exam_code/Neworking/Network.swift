//
//  Network.swift
//  Exam
//
//  Created by Savet on 11/5/19.
//

import Moya
import Alamofire

protocol Network {
	associatedtype T: TargetType
	var provider: MoyaProvider<T> { get }
}

extension MoyaProvider {
	
	final class func examManager() -> Manager {
		let configuration = URLSessionConfiguration.default
		let manager = Manager(configuration: configuration)
		manager.startRequestsImmediately = false
		return manager
	}
	
}
 

