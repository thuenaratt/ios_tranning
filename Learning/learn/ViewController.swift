//
//  ViewController.swift
//  Learning
//
//  Created by Savet on 15/8/23.
//

import UIKit

class ViewController: UIViewController {

	// MARK: - Properties
	private lazy var textField: UITextField = {
		let tf = UITextField()
		tf.translatesAutoresizingMaskIntoConstraints = false
		tf.placeholder = "Placeholder"
		tf.layer.borderWidth = 1
		tf.layer.borderColor = UIColor.gray.cgColor
		tf.layer.cornerRadius = 10
		return tf
	}()
	
	private lazy var label: UILabel = {
		let label = UILabel()
		label.text = "Hello world!"
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	private lazy var btn1: UIButton = {
		let btn = UIButton()
		btn.translatesAutoresizingMaskIntoConstraints = false
		btn.setTitle("1", for: .normal)
		btn.backgroundColor = .lightGray
		return btn
	}()
	
	private lazy var btn2: UIButton = {
		let btn = UIButton()
		btn.translatesAutoresizingMaskIntoConstraints = false
		btn.setTitle("2", for: .normal)
		btn.backgroundColor = .lightGray
		return btn
	}()
	
	private lazy var btn3: UIButton = {
		let btn = UIButton()
		btn.translatesAutoresizingMaskIntoConstraints = false
		btn.setTitle("3", for: .normal)
		btn.backgroundColor = .lightGray
		return btn
	}()
	
	// MARK: - life cycle
	override func loadView() {
		super.loadView()
		// prepare view here
		
		view.addSubview(textField)
		view.addSubview(label)
		view.addSubview(btn1)
		view.addSubview(btn2)
		view.addSubview(btn3)
		
		textField.bottomAnchor.constraint(equalTo: label.topAnchor, constant: -20).isActive = true
		textField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		textField.widthAnchor.constraint(equalToConstant: 200).isActive = true
		textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
		
		label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
		
		btn2.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20).isActive = true
		btn2.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		btn2.heightAnchor.constraint(equalToConstant: 45).isActive = true
//		btn2.widthAnchor.constraint(equalToConstant: 50).isActive = true
		
		btn1.trailingAnchor.constraint(equalTo: btn2.leadingAnchor, constant: -10).isActive = true
		btn1.centerYAnchor.constraint(equalTo: btn2.centerYAnchor).isActive = true
		btn1.heightAnchor.constraint(equalTo: btn2.heightAnchor).isActive = true
		btn1.widthAnchor.constraint(equalTo: btn2.widthAnchor).isActive = true
		btn1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
		
		btn3.leadingAnchor.constraint(equalTo: btn2.trailingAnchor, constant: 10).isActive = true
		btn3.topAnchor.constraint(equalTo: btn2.topAnchor).isActive = true
		btn3.heightAnchor.constraint(equalTo: btn2.heightAnchor).isActive = true
		btn3.widthAnchor.constraint(equalTo: btn2.widthAnchor).isActive = true
		btn3.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .white
		title = "Views"
		// Do any additional setup after loading the view.
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
	}
	
	override func viewDidDisappear(_ animated: Bool) {
		super.viewDidDisappear(animated)
	}
	
}

