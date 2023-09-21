//
//  Meta.swift
//  Exam
//
//  Created by Savet on 8/9/23.
//

import Foundation

/*
 {
   "status": 200,
   "title": "",
   "message": "Successfuly"
 }
 */
struct Meta: Decodable {
	
	var status: Int
	var title: String = ""
	var message: String
	
	private enum CodingKeys: String, CodingKey {
		case status = "status"
		case title
		case message
	}
	
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		status = try (values.decodeIfPresent(Int.self, forKey: .status) ?? 0)
		title = try (values.decodeIfPresent(String.self, forKey: .title) ?? "")
		message = try (values.decodeIfPresent(String.self, forKey: .message) ?? "")
	}
	
}

