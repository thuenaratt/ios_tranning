//
//  SplitViewController.swift
//  Exam
//
//  Created by Savet on 14/9/23.
//

import UIKit

class SplitViewController: UISplitViewController, UISplitViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
		delegate = self
		
		if let navigation = viewControllers[0] as? UINavigationController {
		  if let primaryVC = navigation.viewControllers[0] as? WelcomeViewController {
			  primaryVC.clickedAt = { [weak self] indexPath  in
				  self?.clickedAt(indexPath)
			  }
		  }
		}
    }

	private func clickedAt(_ indexPath: IndexPath) {
		let isiPad = UIDevice.current.userInterfaceIdiom == .pad
		var secondaryVC: UIViewController!
		if indexPath.section == 0 {
			switch indexPath.row {
				case 0:
					secondaryVC = ContactsTableViewViewController()
				case 1:
					secondaryVC = CollectionViewController()
					break
				default:
					break
			}
		}else {
			
		}
		
		if secondaryVC != nil {
			if isiPad {
				let nvc = UINavigationController(rootViewController: secondaryVC)
				viewControllers[1] = nvc
			}else {
				if let navVC = viewControllers[0] as? UINavigationController {
				  navVC.pushViewController(secondaryVC, animated: true)
				}
			}
		}
		
	}
	
	func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
		return true
	}
}

