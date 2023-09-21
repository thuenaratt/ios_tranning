//
//  Variable.swift
//  Exam
//
//  Created by Savet on 31/8/23.
//

import Foundation


final class Variable { // Singelon
	
	static let shared: Variable = .init()
	
	var isReqestedPhotos: Bool {
		set {
			UserDefaults.standard.set(newValue, forKey: "isReqestedPhotos") // Share preference
		}
		get {
			UserDefaults.standard.object(forKey: "isReqestedPhotos") as? Bool ?? false
		}
	}
	
	
}
