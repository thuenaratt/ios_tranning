//
//  FromViewController.swift
//  Exam
//
//  Created by Savet on 24/8/23.
//

import UIKit
import Photos

class SignupViewController: UIViewController {

	private var signupView: SignupView!
	
	private var network: NetworkManager!
	
	init(_ network: NetworkManager) {
		super.init(nibName: nil, bundle: nil)
		self.network = network
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func loadView() {
		super.loadView()
		signupView = SignupView()
		signupView.translatesAutoresizingMaskIntoConstraints = false
		
		view.addSubview(signupView)
		signupView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
		signupView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
		signupView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
		signupView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		view.backgroundColor = .white
		signupView.delegate = self
		navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "ic_close"), style: .done, target: self, action: #selector(close))
    }
	
	@objc private func close() {
		dismiss(animated: true)
	}
	
	private func openPhotoAlbume() {
		
		switch PHPhotoLibrary.authorizationStatus() {
			case .restricted, .denied, .notDetermined:
				let isRequested = Variable.shared.isReqestedPhotos
				if isRequested {
					let alert = UIAlertController(title: "Photos permission", message: nil, preferredStyle: .alert)
					
					let noButton = UIAlertAction(title: "No", style: .cancel)
					let yesButton = UIAlertAction(title: "Yes", style: .default) { _ in
						if let url = URL(string:UIApplication.openSettingsURLString) {
							UIApplication.shared.open(url)
						}
					}
					alert.addAction(noButton)
					alert.addAction(yesButton)
					
					present(alert, animated: true)
					
				}else  {
					PHPhotoLibrary.requestAuthorization() { status in
						if status == .authorized {
							Variable.shared.isReqestedPhotos = true
							DispatchQueue.main.async {
								self.showPickPhotos()
							}
						}
					}
				}
				
				return
			default:
				showPickPhotos()
		}
		
	}
	
	private func showPickPhotos() {
		let imagePicker = UIImagePickerController()
		
		imagePicker.delegate = self
		imagePicker.sourceType = .photoLibrary
		imagePicker.allowsEditing = true
		
		present(imagePicker, animated: true)
	}
	
	private func openCamera() {
		switch AVCaptureDevice.authorizationStatus(for: .video) {
			case .denied, .notDetermined:
				
				AVCaptureDevice.requestAccess(for: .video) { allowed in
					if allowed {
						DispatchQueue.main.async {
							self.showCamera()
						}
					}
				}
				break
			default:
				showCamera()
		}
		
		
	}
	
	private func showCamera() {
		let imagePicker = UIImagePickerController()
		
		imagePicker.delegate = self
		imagePicker.sourceType = .camera

		present(imagePicker, animated: true)
	}
	
}

// MARK: - Image picker delegate
extension SignupViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
	
	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
		
		picker.dismiss(animated: true, completion: nil)
		
		guard let image = info[.originalImage] as? UIImage else { return }
		
		signupView.setImage(image)
	}
}

// MARK: - Sign up view delegate
extension SignupViewController: SignupViewDelegate {
	
	func submit(profile: UIImage?, username: String?, cityNam: String?, dob: String?, password: String?) {
		let params: [String: String] = [
			"username": username ?? "",
			"city_name": cityNam ?? "",
			"dob": dob ?? "",
			"password": password ?? ""
		]
		
		let imageData = profile?.pngData() ?? Data()
		network.fetchGenericDataWithSample(endPoint: UserAPIEndPoint.signup(imageData, params), keyPath: "meta.status") { [weak self] (status: Int) in
			if status == 200 {
				NotificationCenter.default.post(name:NSNotification.Name(rawValue: "signup_success"), object: nil, userInfo: ["username": username ?? "", "password": password ?? ""])
				self?.dismiss(animated: true)
			}
		} failure: { error in
			print(error.localizedDescription)
		}

	}
	
	func pickImage(rect: CGRect) {
		// Prepare alert controller
		let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
		let camera = UIAlertAction(title: "Camera", style: .default) { _ in
			self.openCamera()
		}
		let photo = UIAlertAction(title: "Photo", style: .default) { _ in
			self.openPhotoAlbume()
		}
		
		let cancel = UIAlertAction(title: "Cancel", style: .cancel)
		
		actionSheet.addAction(camera)
		actionSheet.addAction(photo)
		actionSheet.addAction(cancel)
		
		let isiPad = UIDevice.current.userInterfaceIdiom == .pad
		
		if isiPad {
			// Make alert controller to pop over in iPad
			actionSheet.popoverPresentationController?.sourceView = view
			let readRect = CGRect(x: rect.minX, y: rect.minY + view.safeAreaInsets.top, width: rect.width, height: rect.height)
			
			actionSheet.popoverPresentationController?.sourceRect = readRect
		}
		
		present(actionSheet, animated: true)
	}
	
}
