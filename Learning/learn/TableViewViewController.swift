//
//  TableViewViewController.swift
//  Learning
//
//  Created by Savet on 22/8/23.
//

import UIKit

class TableViewViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

		title = "Table view"
		view.backgroundColor = .red
		
		navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "ic-close"), style: .done, target: self, action: #selector(back))
        // Do any additional setup after loading the view.
    }
    

	@objc private func back() {
//		navigationController?.popViewController(animated: true)
//		[vc1, vc2: ViewController, vc3, vc4]
		
		for v in navigationController!.viewControllers {
			if let vc = v as? ViewController {
				navigationController?.popToViewController(vc, animated: true)
			}
		}
		let vc = ViewController()
		let nvc = UINavigationController(rootViewController: vc)
//		present(nvc, animated: true)
		navigationController?.pushViewController(vc, animated: true)
	}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
