//
//  NetworkManager.swift
//  Exam
//
//  Created by Savet on 11/5/19.
//

import Moya

struct NetworkManager: Network {
	
	var provider = MoyaProvider<MultiTarget>(manager: MoyaProvider<MultiTarget>.examManager(), plugins: [NetworkLoggerPlugin(verbose: isShowLog)])
	let sampleProvider = MoyaProvider<MultiTarget>(stubClosure: MoyaProvider.immediatelyStub)
	
	func requestDownload(endPoint: TargetType, progress: ProgressBlock?, completion: @escaping (Data) -> Void, failure: @escaping (Error) -> Swift.Void) -> Cancellable {
		return provider.request(MultiTarget(endPoint), progress: progress) { result in
			switch result {
				case let .success(response):
					let data = response.data
					completion(data)
				case .failure(let error):
					failure(error)
			}
		}
	}
	
	func fetchGenericData<T: Decodable>(endPoint: TargetType, keyPath: String? = nil, success: @escaping (T) -> Swift.Void, failure: @escaping (Error) -> Swift.Void) {
		provider.request(MultiTarget(endPoint), callbackQueue: nil, progress: nil) { result in
			switch result {
				case .success(let value):
					do{
						success(try value.map(T.self, atKeyPath: keyPath))
					}catch let error {
						failure(error)
					}
				case .failure(let error):
					failure(error)
			}
		}
	}
	
	func fetchGenericDataWithSample<T: Decodable>(endPoint: TargetType, keyPath: String? = nil, success: @escaping (T) -> Swift.Void, failure: @escaping (Error) -> Swift.Void) {
		sampleProvider.request(MultiTarget(endPoint), callbackQueue: nil, progress: nil) { result in
			switch result {
				case .success(let value):
					do{
						success(try value.map(T.self, atKeyPath: keyPath))
					}catch let error {
						failure(error)
					}
				case .failure(let error):
					failure(error)
			}
		}
	}
	
}
