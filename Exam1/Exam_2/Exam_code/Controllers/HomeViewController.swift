//
//  HomeViewController.swift
//  Exam
//
//  Created by Savet on 4/9/23.
//

import UIKit

class HomeViewController: UIViewController {

	private lazy var label: UILabel = {
		let label = UILabel()
		label.font = .boldSystemFont(ofSize: 20)
		label.text = "Congratulations!"
		label.textColor = .purple
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	init() {
		super.init(nibName: nil, bundle: nil)
		tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "home"), tag: 1)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func loadView() {
		super.loadView()
		view.addSubview(label)
		
		label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
	}
	
	override func viewDidLoad() {
        super.viewDidLoad()
		view.backgroundColor = .white
        // Do any additional setup after loading the view.
    }

}
