//
//  ProfileView.swift
//  Exam
//
//  Created by Savet on 18/9/23.
//

import UIKit

protocol ProfileViewDelegate: AnyObject {
	func openGoogleMaps()
	func openFacebook()
	func onOpenTelegram()
	
}

class ProfileView: UIView {

	private lazy var profileImg: UIImageView = {
		let img = UIImageView()
		img.translatesAutoresizingMaskIntoConstraints = false
		img.image = UIImage(named: "profile_thumbnail")
		return img
	}()
	
	private lazy var usernameLabel: UILabel = {
		let label = UILabel()
		label.text = "Username"
		label.translatesAutoresizingMaskIntoConstraints = false
//		label.adjustsFontSizeToFitWidth = true
		return label
	}()
	
	private lazy var fbButton: UIButton = {
		let btn = UIButton()
		btn.setImage(UIImage(named: "facebook"), for: .normal)
		btn.setTitle("Facebook", for: .normal)
		btn.setTitleColor(.blue, for: .normal)
		btn.addTarget(self, action: #selector(clickedFacebook), for: .touchUpInside)
		if #available(iOS 15.0, *) {
			var config = UIButton.Configuration.borderedTinted()
			config.imagePadding = 8
			btn.configuration = config
		}else {
			btn.imageEdgeInsets = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 8)
		}
		return btn
	}()

	
	private lazy var googleMapsButton: UIButton = {
		let btn = UIButton()
		btn.setImage(UIImage(named: "google-maps"), for: .normal)
		btn.setTitle("Google Maps", for: .normal)
		btn.setTitleColor(.blue, for: .normal)
		btn.addTarget(self, action: #selector(clickedGoogleMaps), for: .touchUpInside)
		
		if #available(iOS 15.0, *) {
			var config = UIButton.Configuration.borderedTinted()
			config.imagePadding = 8
			btn.configuration = config
		}else {
			btn.imageEdgeInsets = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 8)
		}
		return btn
	}()
	
	private lazy var telegramButton: UIButton = {
		let btn = UIButton()
		btn.translatesAutoresizingMaskIntoConstraints = false
		btn.setImage(UIImage(named: "telegram"), for: .normal)
		btn.setTitle("Telegram", for: .normal)
		btn.setTitleColor(.blue, for: .normal)
		btn.addTarget(self, action: #selector(clickedTelegram), for: .touchUpInside)
		
		if #available(iOS 15.0, *) {
			var config = UIButton.Configuration.borderedTinted()
			config.imagePadding = 8
			btn.configuration = config
		}else {
			btn.imageEdgeInsets = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 8)
		}
		return btn
	}()
	
	weak var delegate: ProfileViewDelegate?
	
	init() {
		super.init(frame: .zero)
		
		addSubview(usernameLabel)
		NSLayoutConstraint.activate([
			usernameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
			usernameLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
		])
		
		addSubview(profileImg)
		NSLayoutConstraint.activate([
			profileImg.widthAnchor.constraint(equalToConstant: 150),
			profileImg.heightAnchor.constraint(equalTo: profileImg.widthAnchor),
			profileImg.centerXAnchor.constraint(equalTo: centerXAnchor),
			profileImg.bottomAnchor.constraint(equalTo: usernameLabel.topAnchor, constant: -30)
		])
		
		let stackV = UIStackView()
		stackV.translatesAutoresizingMaskIntoConstraints = false
		stackV.axis = .vertical
		stackV.spacing = 10
		stackV.distribution = .fill
		stackV.addArrangedSubview(fbButton)
		stackV.addArrangedSubview(googleMapsButton)
		
		addSubview(stackV)
		NSLayoutConstraint.activate([
			stackV.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 30),
			stackV.trailingAnchor.constraint(equalTo: centerXAnchor, constant: -10)
		])
		
		addSubview(telegramButton)
		NSLayoutConstraint.activate([
			telegramButton.topAnchor.constraint(equalTo: stackV.topAnchor),
			telegramButton.leadingAnchor.constraint(equalTo: centerXAnchor, constant: 10)
		])
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	@objc private func clickedGoogleMaps() {
		delegate?.openGoogleMaps()
	}
	
	@objc private func clickedFacebook() {
		delegate?.openFacebook()
	}
	
	@objc private func clickedTelegram() {
		delegate?.onOpenTelegram()
	}
}
