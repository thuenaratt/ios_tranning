//
//  Animal.swift
//  Exam
//
//  Created by Savet on 21/9/23.
//

import Foundation

/*
 {
	"name": "Dog",
	"image": "Dog"
 }
 */
struct Aniaml: Codable {
	var name: String = ""
	var image: String = ""
	
	private enum CodingKeys: String, CodingKey {
		case name
		case image
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
	   "name": "Dog",
	   "image": "Dog"
	 }
   ]
 }
 */
struct AnimalsResult: Decodable {
	var meta: Meta?
	var data: [Aniaml] = []
	
	private enum CodingKeys: String, CodingKey {
		case meta
		case data
	}
}
