//
//  Exam.swift
//  Exam
//
//  Created by Savet on 11/5/19.
//

import Moya

protocol Exam {
	
}

extension Exam {
	
	var sampleData: Data {
		fatalError()
	}
	
	func loginHeader() -> [String: String] {
		return [
			"Content-Type": "application/json",
			"Access-Token": "ade95a69-5302-45e5-43Fd-595bfd799ebb",
			"Mobile-Access-Token": "ade95a69-5302-45e5-43Fd-595bfd799ebb",
		]
	}
	
	func baseUrl() -> URL {
		return URL(string: "\(BaseServer.base_url.rawValue)\(BaseServer.api_version.rawValue)")!
	}
}
