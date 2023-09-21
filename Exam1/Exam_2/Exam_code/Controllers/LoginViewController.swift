//
//  LoginViewController.swift
//  Exam
//
//  Created by Savet on 7/9/23.
//

import UIKit

import UIKit

class LoginViewController: UIViewController {

	// MARK: - Properties
	private let network = NetworkManager()
	
	private var loginView: LoginView!
	// Auth
	private var username: String = ""
	private var password: String = ""
	
	// MARK: - Life cycle
	override func loadView() {
		super.loadView()
		loginView = LoginView()
		loginView.translatesAutoresizingMaskIntoConstraints = false
		
		view.addSubview(loginView)
		NSLayoutConstraint.activate([
			loginView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			loginView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
			loginView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
			loginView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
		])
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .white
		loginView.delegate = self
		
		NotificationCenter.default.addObserver(self, selector: #selector(onSignupSuccess(_:)), name: NSNotification.Name(rawValue: "signup_success"), object: nil)
	}
	
	// MARK: - Network/Apis
	private func login(_ username: String, _ password: String) {
		let params: [String: Any] = [
			"username": username,
			"password": password
		]
		network.fetchGenericDataWithSample(endPoint: UserAPIEndPoint.login(params), keyPath: "meta.status") { (status: Int) in
			
			if status == 200 {
				let tabVC = UITabBarController()
				
				// Tab 1
				let splitVC = SplitViewController()
				splitVC.preferredDisplayMode = .oneBesideSecondary
				splitVC.tabBarItem = UITabBarItem(title: "Apple", image: UIImage(named: "apple"), tag: 1)
				
				let welcomeVC = WelcomeViewController()
				let primaryVC = UINavigationController(rootViewController: welcomeVC)
				
				let secondaryVC = UIViewController()
				secondaryVC.view.backgroundColor = .white
				
				splitVC.viewControllers = [primaryVC, secondaryVC]
				
				// Tab 2
				let homeVC = HomeViewController()
				// Tab 3
				let profileVC = ProfileViewController()
				let tabProfile = UINavigationController(rootViewController: profileVC)
				
				tabVC.viewControllers = [splitVC, homeVC, tabProfile]
				
				let allScenes = UIApplication.shared.connectedScenes
				let scene = allScenes.first { $0.activationState == .foregroundActive }
				
				if let windowScene = scene as? UIWindowScene {
					windowScene.keyWindow?.rootViewController = tabVC
				}
				
			}

		} failure: { error in
			print(error.localizedDescription)

		}
		
	}
	
	// MARK: - Actions

	@objc private func onSignupSuccess(_ notification: NSNotification) {
		if let userInfo = notification.userInfo as? [String: String] {
			if let username = userInfo["username"] {
				self.username = username
			}
			
			if let password = userInfo["password"] {
				self.password = password
			}
		}
	}
}

// MARK: - Login view delegate
extension LoginViewController: LoginViewDelegate {

	func onLogin(_ username: String, _ password: String) {
		if username == self.username && password == self.password && username != "" && password != "" {
			login(username, password)
		}else {
			#warning("Mock code")
			login(username, password)
			
//			let alertVC = UIAlertController(title: "Login failed!", message: "Your username or password not correct.", preferredStyle: .alert)
//			
//			let cancel = UIAlertAction(title: "Ok", style: .cancel)
//			alertVC.addAction(cancel)
//			present(alertVC, animated: true)
		}
	}

	func onSignup() {
		// Go to screen sign up
		let signupVC = SignupViewController(network)
		let nvc = UINavigationController(rootViewController: signupVC)
		nvc.modalPresentationStyle = .overFullScreen
		present(nvc, animated: true)
	}

}
