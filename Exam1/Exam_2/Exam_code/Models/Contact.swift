//
//  Contact.swift
//  Exam
//
//  Created by Savet on 23/8/23.
//

import Foundation

/*
 {
	"name": "Sopheaktra",
	"phone": "053 334 100",
	"status": "Active"
 }
 */
struct Contact: Decodable { // Model
	
	var profile: String = ""
	var name: String = ""
	var status: String = ""
	var phone: String = ""
	
	private enum CodingKeys: String, CodingKey {
		case name
		case phone
		case status
	}
}

/*
 {
   "meta": {
	 "status": 200,
	 "title": "",
	 "message": "Successfuly"
   },
   "data": [
	 {
	   "name": "Dara",
	   "phone": "012 334 456",
	   "status": "Active"
	 }
   ]
 }
 */

struct ContactsResult: Decodable {
	var meta: Meta?
	var data: [Contact] = []
	
	private enum CodingKeys: String, CodingKey {
		case meta
		case data
	}
}
