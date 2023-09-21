//
//  AnimalCollectionViewCell.swift
//  Exam
//
//  Created by Savet on 6/9/23.
//

import UIKit

class AnimalCollectionViewCell: UICollectionViewCell {
    
	private lazy var imageView: UIImageView = {
		let imageV = UIImageView()
		imageV.translatesAutoresizingMaskIntoConstraints = false
		return imageV
	}()
	
	private var widthImage: NSLayoutConstraint!
	private var heightImage: NSLayoutConstraint!
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		contentView.addSubview(imageView)
		imageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
		imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
		imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
		imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
		widthImage = imageView.widthAnchor.constraint(equalToConstant: 0)
		heightImage = imageView.heightAnchor.constraint(equalToConstant: 0)
		
		imageView.contentMode = .scaleToFill
	}
	
	
	override func layoutSubviews() {
		super.layoutSubviews()
		configView()
	}
	
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func configView() {
		clipsToBounds = false
		layer.cornerRadius = 4
		layer.shadowColor = UIColor.black.cgColor
		layer.shadowOffset = CGSize(width: 1, height: 2.0)
		layer.shadowRadius = 4
		layer.shadowOpacity = 0.1
	}
	
	func setImage(animal: Aniaml) {
		imageView.image = UIImage(named: animal.image)

	}
}
