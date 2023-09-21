//
//  ProfileViewController.swift
//  Exam
//
//  Created by Savet on 4/9/23.
//

import UIKit

class ProfileViewController: UIViewController {

	private lazy var profileView: ProfileView = {
		let profileV = ProfileView()
		profileV.translatesAutoresizingMaskIntoConstraints = false
		return profileV
	}()
	
	init() {
		super.init(nibName: nil, bundle: nil)
		tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "profile"), tag: 1)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func loadView() {
		super.loadView()
		view.addSubview(profileView)
		profileView.delegate = self
		
		
		NSLayoutConstraint.activate([
			profileView.topAnchor.constraint(equalTo: view.topAnchor),
			profileView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
			profileView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			profileView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
		])
		
		navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "share"), style: .done, target: self, action: #selector(share))
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		view.backgroundColor = .white
		
    }

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
	}
	
	@objc private func share() {
		
	}
}

extension ProfileViewController: ProfileViewDelegate {
	
	
	func openGoogleMaps() {
		let url = URL(string: "comgooglemaps://?daddr=\(11.564181),\(104.886422)&directionsmode=driving")!
//		let url = URL(string: "comgooglemaps://")!
		if UIApplication.shared.canOpenURL(url) {
			print("My phone have App Google Maps")
			UIApplication.shared.open(url)
		}else {
			let url = URL(string: "https://itunes.apple.com/us/app/google-maps-transit-food/id585027354")!
			UIApplication.shared.open(url)
		}
	}
	
	func openFacebook() {
		
	}
	
	func onOpenTelegram() {
		
	}
	
}
