//
//  LoginView.swift
//  Exam
//
//  Created by Savet on 13/9/23.
//

import UIKit

protocol LoginViewDelegate: AnyObject {
	func onLogin(_ username: String, _ password: String)
	func onSignup()
}

class LoginView: UIView {

	private lazy var usernameTextF: UITextField = {
		let textF = UITextField()
		textF.translatesAutoresizingMaskIntoConstraints = false
		textF.placeholder = "Username"
		textF.delegate = self
		return textF
	}()
	
	private lazy var passwordTextF: UITextField = {
		let textF = UITextField()
		textF.translatesAutoresizingMaskIntoConstraints = false
		textF.isSecureTextEntry = true
		textF.delegate = self
		textF.placeholder = "Password"
		return textF
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
	
	private lazy var signupButton: UIButton = {
		let btn = UIButton(type: .system)
		btn.translatesAutoresizingMaskIntoConstraints = false
		btn.setTitle("Sign up?", for: .normal)
		btn.addTarget(self, action: #selector(signup), for: .touchUpInside)
		return btn
	}()
	
	weak var delegate: LoginViewDelegate?
	
	init() {
		super.init(frame: .zero)
		
		let borderPW = UIView()
		borderPW.translatesAutoresizingMaskIntoConstraints = false
		borderPW.layer.cornerRadius = 5
		borderPW.layer.borderColor = UIColor.lightGray.cgColor
		borderPW.layer.borderWidth = 1
		
		addSubview(borderPW)
		NSLayoutConstraint.activate([
			borderPW.widthAnchor.constraint(equalToConstant: 250),
			borderPW.heightAnchor.constraint(equalToConstant: 45),
			borderPW.centerXAnchor.constraint(equalTo: centerXAnchor),
			borderPW.centerYAnchor.constraint(equalTo: centerYAnchor)
		])
		let lockImg = UIImageView()
		lockImg.translatesAutoresizingMaskIntoConstraints = false
		lockImg.image = UIImage(named: "ic_lock")
		
		borderPW.addSubview(lockImg)
		borderPW.addSubview(passwordTextF)
		NSLayoutConstraint.activate([
			lockImg.widthAnchor.constraint(equalToConstant: 22),
			lockImg.heightAnchor.constraint(equalToConstant: 22),
			lockImg.centerYAnchor.constraint(equalTo: borderPW.centerYAnchor),
			lockImg.leadingAnchor.constraint(equalTo: borderPW.leadingAnchor, constant: 10),
			passwordTextF.centerYAnchor.constraint(equalTo: lockImg.centerYAnchor),
			passwordTextF.leadingAnchor.constraint(equalTo: lockImg.trailingAnchor, constant: 10),
			passwordTextF.trailingAnchor.constraint(equalTo: borderPW.trailingAnchor, constant: -10)
		])
		
		let borderUS = UIView()
		borderUS.translatesAutoresizingMaskIntoConstraints = false
		borderUS.layer.cornerRadius = 5
		borderUS.layer.borderColor = UIColor.lightGray.cgColor
		borderUS.layer.borderWidth = 1
		
		addSubview(borderUS)
		NSLayoutConstraint.activate([
			borderUS.widthAnchor.constraint(equalToConstant: 250),
			borderUS.heightAnchor.constraint(equalToConstant: 45),
			borderUS.centerXAnchor.constraint(equalTo: centerXAnchor),
			borderUS.bottomAnchor.constraint(equalTo: borderPW.topAnchor, constant: -15)
		])
		
		let userImg = UIImageView()
		userImg.translatesAutoresizingMaskIntoConstraints = false
		userImg.image = UIImage(named: "ic_user")
		
		borderUS.addSubview(userImg)
		borderUS.addSubview(usernameTextF)
		NSLayoutConstraint.activate([
			userImg.widthAnchor.constraint(equalToConstant: 22),
			userImg.heightAnchor.constraint(equalToConstant: 22),
			userImg.centerYAnchor.constraint(equalTo: borderUS.centerYAnchor),
			userImg.leadingAnchor.constraint(equalTo: borderUS.leadingAnchor, constant: 10),
			usernameTextF.centerYAnchor.constraint(equalTo: userImg.centerYAnchor),
			usernameTextF.leadingAnchor.constraint(equalTo: userImg.trailingAnchor, constant: 10),
			usernameTextF.trailingAnchor.constraint(equalTo: borderUS.trailingAnchor, constant: -10)
		])
		
		let contentView = UIView()
		contentView.translatesAutoresizingMaskIntoConstraints = false
		
		let appleImv = UIImageView()
		appleImv.translatesAutoresizingMaskIntoConstraints = false
		appleImv.image = UIImage(named: "apple-logo")
		
		let welcomeLabel = UILabel()
		welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
		welcomeLabel.text = "Welcome!"
		welcomeLabel.font = UIFont.boldSystemFont(ofSize: 17)
		
		addSubview(contentView)
		NSLayoutConstraint.activate([
			contentView.bottomAnchor.constraint(equalTo: borderUS.topAnchor, constant: -40),
			contentView.centerXAnchor.constraint(equalTo: centerXAnchor)
		])
		
		contentView.addSubview(appleImv)
		contentView.addSubview(welcomeLabel)
		NSLayoutConstraint.activate([
			appleImv.widthAnchor.constraint(equalToConstant: 25),
			appleImv.heightAnchor.constraint(equalToConstant: 25),
			appleImv.topAnchor.constraint(equalTo: contentView.topAnchor),
			appleImv.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
			appleImv.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
			welcomeLabel.centerYAnchor.constraint(equalTo: appleImv.centerYAnchor),
			welcomeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
			welcomeLabel.leadingAnchor.constraint(equalTo: appleImv.trailingAnchor, constant: 10)
		])
		
		addSubview(loginButton)
		NSLayoutConstraint.activate([
			loginButton.centerXAnchor.constraint(equalTo: centerXAnchor),
			loginButton.widthAnchor.constraint(equalToConstant: 150),
			loginButton.heightAnchor.constraint(equalToConstant: 40),
			loginButton.topAnchor.constraint(equalTo: borderPW.bottomAnchor, constant: 40)
		])
		
		addSubview(signupButton)
		NSLayoutConstraint.activate([
			signupButton.centerXAnchor.constraint(equalTo: centerXAnchor),
			signupButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 8)
		])
		
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	@objc private func login() {
		delegate?.onLogin(usernameTextF.text ?? "", passwordTextF.text ?? "")
	}
	
	@objc private func signup() {
		delegate?.onSignup()
	}
}

extension LoginView: UITextFieldDelegate {
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		return false
	}
	
}
