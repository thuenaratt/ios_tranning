//
//  LoginResult.swift
//  Exam
//
//  Created by Savet on 20/9/23.
//

import Foundation

/*
{ // LoginResult
  "metaw": { // Meta
	"status": 200,
	"title": "",
	"message": "Successfuly"
  },
	"data": {}
}
*/

struct LoginResult: Decodable {
	
	var meta: Meta?
	
	private enum CodingKeys: String, CodingKey {
		case meta = "metaw"
	}
}
