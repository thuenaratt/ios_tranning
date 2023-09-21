//
//  FormView.swift
//  Exam
//
//  Created by Savet on 24/8/23.
//

import UIKit

protocol SignupViewDelegate: AnyObject {
	func submit(profile: UIImage?, username: String?, cityNam: String?, dob: String?, password: String?)
	func pickImage(rect: CGRect)
}

class SignupView: UIView {
	
	private let places = ["Phnom Penh", "Kondal", "Prey Veng", "Svay Rieng", "Takeo", "Kompong Spuv", "Keb", "Kompot"]
	
	private let tmpTF = UITextField()
	
	private var profile: UIImageView!
	private var camerImageV: UIImageView!
	private var control: UIControl!
	private var nameTextField: UITextField!
	
	private var cityNameTF: UITextField!
	private var birthdayTF: UITextField!
	
	private var isPickingDate = false
	private var datePicker: UIDatePicker!
	
	private lazy var passwordTextF: UITextField = {
		let textF = UITextField()
		textF.translatesAutoresizingMaskIntoConstraints = false
		textF.isSecureTextEntry = true
		textF.delegate = self
		textF.placeholder = "Password"
		return textF
	}()
	
	private var signupButton: UIButton!
	
	weak var delegate: SignupViewDelegate?
	
	private var centerContent: NSLayoutConstraint!
	
	init() {
		super.init(frame: .zero)
		
		addSubview(tmpTF)
		
		profile = UIImageView()
		profile.translatesAutoresizingMaskIntoConstraints = false
		profile.image = UIImage(named: "profile_thumbnail")
		
		camerImageV = UIImageView()
		camerImageV.translatesAutoresizingMaskIntoConstraints = false
		camerImageV.image = UIImage(named: "camera")
		
		control = UIControl()
		control.translatesAutoresizingMaskIntoConstraints = false
		control.addTarget(self, action: #selector(pickImage), for: .touchUpInside)
		
		nameTextField = UITextField()
		nameTextField.delegate = self
		nameTextField.translatesAutoresizingMaskIntoConstraints = false
		nameTextField.placeholder = "Username"
		
		let borderUS = UIView()
		borderUS.translatesAutoresizingMaskIntoConstraints = false
		borderUS.layer.borderWidth = 1
		borderUS.layer.borderColor = UIColor.gray.cgColor
		borderUS.layer.cornerRadius = 4
		
		let userImg = UIImageView()
		userImg.image = UIImage(named: "ic_user")
		userImg.translatesAutoresizingMaskIntoConstraints = false
		
		addSubview(borderUS)
		borderUS.addSubview(nameTextField)
		borderUS.addSubview(userImg)
		centerContent = borderUS.bottomAnchor.constraint(equalTo: centerYAnchor)
		NSLayoutConstraint.activate([
			borderUS.widthAnchor.constraint(equalToConstant: 250),
			borderUS.heightAnchor.constraint(equalToConstant: 45),
			borderUS.centerXAnchor.constraint(equalTo: centerXAnchor),
			centerContent,
			userImg.widthAnchor.constraint(equalToConstant: 22),
			userImg.heightAnchor.constraint(equalToConstant: 22),
			userImg.leadingAnchor.constraint(equalTo: borderUS.leadingAnchor, constant: 10),
			userImg.centerYAnchor.constraint(equalTo: borderUS.centerYAnchor),
			nameTextField.centerYAnchor.constraint(equalTo: userImg.centerYAnchor),
			nameTextField.leadingAnchor.constraint(equalTo: userImg.trailingAnchor, constant: 10),
			nameTextField.trailingAnchor.constraint(equalTo: borderUS.trailingAnchor, constant: -10)
		])
		
		addSubview(profile)
		addSubview(camerImageV)
		addSubview(control)
		NSLayoutConstraint.activate([
			profile.widthAnchor.constraint(equalToConstant: 150),
			profile.heightAnchor.constraint(equalToConstant: 150),
			profile.centerXAnchor.constraint(equalTo: centerXAnchor),
			profile.bottomAnchor.constraint(equalTo: borderUS.topAnchor, constant: -20),
			
			camerImageV.widthAnchor.constraint(equalToConstant: 30),
			camerImageV.heightAnchor.constraint(equalToConstant: 30),
			camerImageV.centerXAnchor.constraint(equalTo: profile.centerXAnchor),
			camerImageV.bottomAnchor.constraint(equalTo: profile.bottomAnchor, constant: -10),
			
			control.topAnchor.constraint(equalTo: profile.topAnchor),
			control.bottomAnchor.constraint(equalTo: profile.bottomAnchor),
			control.leadingAnchor.constraint(equalTo: profile.leadingAnchor),
			control.trailingAnchor.constraint(equalTo: profile.trailingAnchor),
		])
		
		let cityLabel = UILabel()
		cityLabel.translatesAutoresizingMaskIntoConstraints = false
		cityLabel.text = "City"
		cityLabel.font = UIFont.systemFont(ofSize: 17, weight: .medium)
		
		addSubview(cityLabel)
		cityLabel.topAnchor.constraint(equalTo: borderUS.bottomAnchor, constant: 15).isActive = true
		cityLabel.leadingAnchor.constraint(equalTo: borderUS.leadingAnchor).isActive = true
		cityLabel.heightAnchor.constraint(equalToConstant: 45).isActive = true
		cityLabel.widthAnchor.constraint(equalToConstant: 40).isActive = true
		
		let cityControl = UIControl()
		cityControl.translatesAutoresizingMaskIntoConstraints = false
		cityControl.addTarget(self, action: #selector(pickCity), for: .touchUpInside)
		cityControl.backgroundColor = UIColor(red: 229/255, green: 229/255, blue: 229/255, alpha: 1)
		
		let arrowDownImg = UIImageView()
		arrowDownImg.image = UIImage(named: "arrow_down")
		arrowDownImg.translatesAutoresizingMaskIntoConstraints = false
		
		cityNameTF = UITextField()
		cityNameTF.isEnabled = false
		cityNameTF.translatesAutoresizingMaskIntoConstraints = false
		cityNameTF.placeholder = "Select City"
		cityNameTF.textAlignment = .center
		
		addSubview(cityControl)
		cityControl.addSubview(cityNameTF)
		cityControl.addSubview(arrowDownImg)
		NSLayoutConstraint.activate([
			cityControl.topAnchor.constraint(equalTo: cityLabel.topAnchor),
			cityControl.bottomAnchor.constraint(equalTo: cityLabel.bottomAnchor),
			cityControl.leadingAnchor.constraint(equalTo: cityLabel.trailingAnchor, constant: 15),
			cityControl.trailingAnchor.constraint(equalTo: borderUS.trailingAnchor),
			
			cityNameTF.topAnchor.constraint(equalTo: cityControl.topAnchor),
			cityNameTF.bottomAnchor.constraint(equalTo: cityControl.bottomAnchor),
			cityNameTF.leadingAnchor.constraint(equalTo: cityControl.leadingAnchor),
			
			arrowDownImg.widthAnchor.constraint(equalToConstant: 20),
			arrowDownImg.heightAnchor.constraint(equalToConstant: 20),
			arrowDownImg.leadingAnchor.constraint(equalTo: cityNameTF.trailingAnchor, constant: 10),
			arrowDownImg.trailingAnchor.constraint(equalTo: cityControl.trailingAnchor, constant: -10),
			arrowDownImg.centerYAnchor.constraint(equalTo: cityControl.centerYAnchor)
		])
		
		
		let birthdayControl = UIControl()
		birthdayControl.translatesAutoresizingMaskIntoConstraints = false
		birthdayControl.addTarget(self, action: #selector(pickBirthday), for: .touchUpInside)
		birthdayControl.backgroundColor = UIColor(red: 229/255, green: 229/255, blue: 229/255, alpha: 1)
		
		birthdayTF = UITextField()
		birthdayTF.isEnabled = false
		birthdayTF.translatesAutoresizingMaskIntoConstraints = false
		birthdayTF.placeholder = "Birthday"
		birthdayTF.textAlignment = .center
		
		addSubview(birthdayControl)
		birthdayControl.addSubview(birthdayTF)
		NSLayoutConstraint.activate([
			birthdayControl.heightAnchor.constraint(equalToConstant: 45),
			birthdayControl.centerXAnchor.constraint(equalTo: centerXAnchor),
			birthdayControl.topAnchor.constraint(equalTo: cityControl.bottomAnchor, constant: 15),
			birthdayControl.leadingAnchor.constraint(equalTo: borderUS.leadingAnchor),
			birthdayControl.trailingAnchor.constraint(equalTo: borderUS.trailingAnchor),
			birthdayTF.centerYAnchor.constraint(equalTo: birthdayControl.centerYAnchor),
			birthdayTF.leadingAnchor.constraint(equalTo: birthdayControl.leadingAnchor, constant: 10),
			birthdayTF.trailingAnchor.constraint(equalTo: birthdayControl.trailingAnchor, constant: -10)
		])
	
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
			borderPW.topAnchor.constraint(equalTo: birthdayControl.bottomAnchor, constant: 15)
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
		
		signupButton = UIButton(type: .system)
		signupButton.setTitle("Sign up", for: .normal)
		signupButton.setTitleColor(.white, for: .normal)
		signupButton.backgroundColor = .blue
		signupButton.addTarget(self, action: #selector(submit), for: .touchUpInside)
		signupButton.translatesAutoresizingMaskIntoConstraints = false
		signupButton.layer.cornerRadius = 6
		
		addSubview(signupButton)
		signupButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
		signupButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40).isActive = true
		signupButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
		signupButton.widthAnchor.constraint(equalToConstant: 120).isActive = true
		
		profile.layer.masksToBounds = true
		
		cityControl.layer.masksToBounds = true
		cityControl.layer.cornerRadius = 4
		
		birthdayControl.layer.masksToBounds = true
		birthdayControl.layer.cornerRadius = 4
		
		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		control.layer.masksToBounds = true
		profile.layer.cornerRadius = profile.frame.width / 2
		control.layer.cornerRadius = control.frame.width / 2
	}
	
	
	func setImage(_ image: UIImage) {
		profile.image = image
	}
	
	private func moveView(constant: CGFloat) {
		centerContent!.constant = -constant
		UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {
			self.layoutIfNeeded()
		}, completion: nil)
	}
	
	// MARK: - Actions
	@objc private func keyboardWillShow(notification: NSNotification) {
		if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
			let keyboardRectangle = keyboardFrame.cgRectValue
			let keyboardHeight = keyboardRectangle.height
			moveView(constant: keyboardHeight / 2)
		}
	}
	
	@objc private func keyboardWillHide(notification: NSNotification) {
		moveView(constant: 0)
	}
	
	@objc private func submit() {
		delegate?.submit(profile: profile.image, username: nameTextField.text, cityNam: cityNameTF.text, dob: birthdayTF.text, password: passwordTextF.text)
	}
	
	@objc private func pickImage() {
		delegate?.pickImage(rect: camerImageV.frame)
	}
	
	@objc private func pickCity() {
		let pickerView = UIPickerView()
		pickerView.dataSource = self
		pickerView.delegate = self

		tmpTF.inputView = pickerView
		
		let toolbar = UIToolbar()
		toolbar.sizeToFit()

		let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(clickDone))
		let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
		toolbar.setItems([flexibleSpace, doneButton], animated: true)

		tmpTF.inputAccessoryView = toolbar
		tmpTF.becomeFirstResponder()
	}
	
	@objc private func pickBirthday() {
		datePicker = UIDatePicker()
		
		datePicker.datePickerMode = .date
		if #available(iOS 13.0, *) {
			datePicker.preferredDatePickerStyle = .wheels
		}
		tmpTF.inputView = datePicker
		
		let toolbar = UIToolbar()
		toolbar.sizeToFit()
		
		let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(clickDone))
		let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
		toolbar.setItems([flexibleSpace, doneButton], animated: true)
		
		tmpTF.inputAccessoryView = toolbar
		isPickingDate = true
		tmpTF.becomeFirstResponder()
	}
	
	@objc private func clickDone() {
		tmpTF.resignFirstResponder()
		if isPickingDate {
			let formatter = DateFormatter()
			formatter.dateFormat = "dd-MM-yyyy"
			formatter.locale = Locale(identifier: "en")
			formatter.timeZone = TimeZone(identifier: "Asia/Phnom_Penh")
			let date = formatter.string(from: datePicker.date)
			birthdayTF.text = date
			isPickingDate = false
		}
	}
}

extension SignupView: UIPickerViewDataSource {
	func numberOfComponents(in pickerView: UIPickerView) -> Int {
		return 1
	}
	
	func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		return places.count
	}
	
}


extension SignupView: UIPickerViewDelegate {
	
	func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
		return places[row]
	}
	
	func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
		cityNameTF.text = places[row]
		
	}
}

extension SignupView: UITextFieldDelegate {
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		return false
	}
	
}
