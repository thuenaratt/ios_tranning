//
//  TableViewViewController.swift
//  Exam
//
//  Created by Savet on 22/8/23.
//

import UIKit

class ContactsTableViewViewController: UITableViewController {

	// MARK: - Properties
	private var network = NetworkManager()
	private var contacts: [Contact] = []
	
	// MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
		
		title = "Table view"
		view.backgroundColor = .white
		
		tableView.register(ContactTableViewCell.self, forCellReuseIdentifier: "cell")
		mockData()
    }

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return contacts.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ContactTableViewCell {
			cell.setupInfo(contact: contacts[indexPath.row])
			cell.onClicked = { [weak self] name in
				print(name)
			}
//			cell.separatorInset = UIEdgeInsets(top: 0, left: 15 + 35 + 20, bottom: 0, right: 0)
			cell.separatorInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
			return cell
		}
		
		return UITableViewCell()
	}
	
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 35 + 15 + 15
	}
	
	// MARK: - Mock
	private func mockData() {
		
		network.fetchGenericDataWithSample(endPoint: UserAPIEndPoint.getContacts) { [weak self] (result: ContactsResult) in
			if result.meta?.status == 200 {
				self?.contacts = result.data
				self?.tableView.reloadData()
			}
		} failure: { error in
			print(error.localizedDescription)
		}

	}
}
