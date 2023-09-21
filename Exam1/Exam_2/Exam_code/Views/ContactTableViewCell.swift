//
//  ContactTableViewCell.swift
//  Exam
//
//  Created by Savet on 23/8/23.
//

import UIKit

class ContactTableViewCell: UITableViewCell {
	
	var onClicked: ((String) -> Void)?
	
	private var contact: Contact!
	
	private lazy var profileImagV: UIImageView = {
		let imgV = UIImageView()
		imgV.translatesAutoresizingMaskIntoConstraints = false
		imgV.backgroundColor = .lightGray
		return imgV
	}()
	
	private lazy var nameLabel: UILabel = {
		let lb = UILabel()
		lb.translatesAutoresizingMaskIntoConstraints = false
		lb.font = UIFont.systemFont(ofSize: 17, weight: .medium)
		return lb
	}()

	private lazy var statusLabel: UILabel = {
		let lb = UILabel()
		lb.translatesAutoresizingMaskIntoConstraints = false
		lb.font = UIFont.systemFont(ofSize: 12, weight: .regular)
		lb.textAlignment = .center
		lb.backgroundColor = .green
		return lb
	}()
	
	private lazy var phoneLabel: UILabel = {
		let lb = UILabel()
		lb.translatesAutoresizingMaskIntoConstraints = false
		lb.font = UIFont.systemFont(ofSize: 15, weight: .regular)
		lb.textColor = .lightGray
		return lb
	}()
	
	private lazy var control: UIControl = {
		let conr = UIControl()
		conr.translatesAutoresizingMaskIntoConstraints = false
		conr.backgroundColor = .red
		conr.addTarget(self, action: #selector(clicked), for: .touchUpInside)
		return conr
	}()
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		contentView.addSubview(profileImagV)
		contentView.addSubview(nameLabel)
		contentView.addSubview(statusLabel)
		contentView.addSubview(phoneLabel)
		contentView.addSubview(control)
		
		profileImagV.heightAnchor.constraint(equalToConstant: 35).isActive = true
		profileImagV.widthAnchor.constraint(equalToConstant: 35).isActive = true
		profileImagV.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
//		profileImagV.widthAnchor.constraint(equalTo: profileImagV.heightAnchor).isActive = true
//		profileImagV.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
		profileImagV.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
//		profileImagV.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15).isActive = true
		
		nameLabel.topAnchor.constraint(equalTo: profileImagV.topAnchor).isActive = true
		nameLabel.leadingAnchor.constraint(equalTo: profileImagV.trailingAnchor, constant: 20).isActive = true

		statusLabel.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor).isActive = true
		statusLabel.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 20).isActive = true
		statusLabel.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -15).isActive = true
		statusLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
		statusLabel.heightAnchor.constraint(equalToConstant: 16).isActive = true
		
		phoneLabel.leadingAnchor.constraint(equalTo: profileImagV.trailingAnchor, constant: 20).isActive = true
		phoneLabel.bottomAnchor.constraint(equalTo: profileImagV.bottomAnchor).isActive = true
		
		control.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
		control.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
		control.widthAnchor.constraint(equalToConstant: 60).isActive = true
		control.heightAnchor.constraint(equalToConstant: 25).isActive = true
		
		statusLabel.layer.cornerRadius = 4
		
		profileImagV.layer.cornerRadius = 35 / 2
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setupInfo(contact: Contact) {
		self.contact = contact
		nameLabel.text = contact.name
		statusLabel.text = contact.status
		phoneLabel.text = contact.phone
	}
	
	@objc private func clicked() {
		onClicked?(contact.name)
	}
}
