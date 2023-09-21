//
//  Servers.swift
//  Exam
//
//  Created by Savet on 7/9/23.
//

import Foundation

#if PRODUCTION
enum BaseServer: String {
	case base_url = "https://prodution-api2030.com:3001"
	case api_version = "/api/v1_0"
}
let isShowLog = false

#else
enum BaseServer: String {
	case base_url = "https://development-api2030.com:4000"
	case api_version = "/api/v1_0"
}

let isShowLog = true
#endif
