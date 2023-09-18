//
//  LoginViewController.swift
//  Exam
//
//  Created by Savet on 7/9/23.
//

import UIKit

import UIKit

class LoginViewController: UIViewController {

	private let network = NetworkManager()
	private lazy var containerView: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	private lazy var imageView: UIImageView = {
		let imgV = UIImageView()
		imgV.translatesAutoresizingMaskIntoConstraints = false
		imgV.image = UIImage(named: "apple-icon")
		return imgV
	}()
	
	private lazy var welcomeLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Welcome!"
		label.font = UIFont.boldSystemFont(ofSize: 17)
		return label
	}()
	
	private lazy var loginButton: UIButton = {
		let btn = UIButton()
		btn.translatesAutoresizingMaskIntoConstraints = false
		btn.backgroundColor = .blue
		btn.setTitle("Login", for: .normal)
		btn.setTitleColor(.white, for: .normal)
		btn.layer.cornerRadius = 8
		btn.addTarget(self, action: #selector(login), for: .touchUpInside)
		return btn
	}()
	 
	override func loadView() {
		super.loadView()
		view.addSubview(containerView)
		containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
		
		containerView.addSubview(imageView)
		containerView.addSubview(welcomeLabel)
		
		imageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
		imageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
		imageView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
		imageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
		imageView.widthAnchor.constraint(equalToConstant: 25).isActive = true
		imageView.heightAnchor.constraint(equalToConstant: 25).isActive = true
		
		welcomeLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10).isActive = true
		welcomeLabel.centerYAnchor.constraint(equalTo: imageView.centerYAnchor).isActive = true
		welcomeLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
		
		view.addSubview(loginButton)
		loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		loginButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
		loginButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
		loginButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
		
		print(BaseServer.base_url.rawValue)
		
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .white

		getAnimals()
	}
	
	// MARK: - Network/Apis
	private func getAnimals() {
		let params: [String: Any] = [
			"uuid": "1234567890",
			"id": ""
		]
		network.fetchGenericDataWithSample(endPoint: UserAPIEndPoint.getAnimals(params), keyPath: "meta.status") { (status: Int) in
			
			print(status)
			

		} failure: { error in
			print(error.localizedDescription)

		}
		
	}

	
	// MARK: - Actions
	@objc private func login() {
		
	}

}
