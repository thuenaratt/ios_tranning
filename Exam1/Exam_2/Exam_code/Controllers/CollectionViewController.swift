//
//  CollectionViewController.swift
//  Exam
//
//  Created by Savet on 6/9/23.
//

import UIKit

class CollectionViewController: UIViewController {

	private let network = NetworkManager()
	
	private var animals: [Aniaml] = []
	
	private var collectionView: UICollectionView!
	
	override func loadView() {
		super.loadView()
		
		let layout = UICollectionViewFlowLayout()
		layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
		layout.itemSize = CGSize(width: 90, height: 90)
		
		collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
		collectionView.register(AnimalCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
		
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		
		view.addSubview(collectionView)
		collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
		collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
		collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
		collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		view.backgroundColor = .white
		collectionView.dataSource = self
		collectionView.delegate = self
		getAnimals()
		
    }

	// MARK: - Network/APIs
	private func getAnimals() {
		network.fetchGenericDataWithSample(endPoint: UserAPIEndPoint.getAnimals) { [weak self] (result: AnimalsResult) in
			if result.meta?.status == 200 {
				self?.animals = result.data
				self?.collectionView.reloadData()
			}
		} failure: { error in
			print(error.localizedDescription)
		}

	}
	
}

extension CollectionViewController: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return animals.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! AnimalCollectionViewCell
		cell.setImage(animal: animals[indexPath.row])
		
		cell.backgroundColor = UIColor(red: 227/255, green: 227/255, blue: 227/255, alpha: 1)
		return cell
	}
	
}

extension CollectionViewController: UICollectionViewDelegate {
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		print(animals[indexPath.row])
	}
	
}
