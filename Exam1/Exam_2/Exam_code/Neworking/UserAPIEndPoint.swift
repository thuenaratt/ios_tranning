//
//  UserAPIEndPoint.swift
//  Exam
//
//  Created by Savet on 9/7/23.
//

import Moya

enum UserAPIEndPoint {
	case signup(_ image: Data, _ params: [String: String])
	case login(_ params: [String: Any])
	case logout
	case getContacts
	case getAnimals
}

extension UserAPIEndPoint: Exam, TargetType {
	
	var baseURL: URL {
		return baseUrl()
	}
	
	var path: String {
		switch self {
			case .login:
				return "/user/login"
			case .logout:
				return "/user/logout"
			case .signup:
				return "/user/register"
			case .getContacts:
				return "/user/contacts"
			case .getAnimals:
				return "/animal/list"
		}
	}
	
	var method: Moya.Method {
		switch self {
			case  .login, .signup:
				return .post
			default:
				return .get
		}
	}
	
	var task: Task {
		switch self {
			case .logout, .getContacts, .getAnimals:
				return .requestPlain
			case .login(let params):
				return .requestParameters(parameters: params, encoding: JSONEncoding.default)
			case .signup(let image, let params):
				var multipartData: [MultipartFormData] = []
				for (key, value) in params {
					multipartData.append(MultipartFormData(provider: .data(Data(value.utf8)), name: key))
				}
				multipartData.append(MultipartFormData(provider: .data(image), name: "msg", fileName: "profile.png", mimeType: "image/png"))
				
				return .uploadMultipart(multipartData)
		}
	}
	
	var headers: [String : String]? {
		switch self {
			case .login:
				return loginHeader()
			case .logout:
				return loginHeader()
			default:
				return loginHeader()
		}
	}
	
	var sampleData: Data {
		switch self {
			case .login:
				guard let url = Bundle.main.url(forResource: "LoginResult", withExtension: "json"), let data = try? Data(contentsOf: url) else {
						return Data()
					  }
					  return data
			case .signup:
				guard let url = Bundle.main.url(forResource: "SignupResult", withExtension: "json"), let data = try? Data(contentsOf: url) else {
						return Data()
					  }
					  return data
			case .getContacts:
				guard let url = Bundle.main.url(forResource: "Contacts", withExtension: "json"), let data = try? Data(contentsOf: url) else {
						return Data()
					  }
					  return data
			case .getAnimals:
				guard let url = Bundle.main.url(forResource: "Animal", withExtension: "json"), let data = try? Data(contentsOf: url) else {
						return Data()
					  }
					  return data
			default:
				return Data()
		}
	}
}
