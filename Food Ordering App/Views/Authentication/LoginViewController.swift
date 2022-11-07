//
//  RegistrationViewController.swift
//  Food Ordering App
//
//  Created by Anisha Lamichhane on 07/11/2022.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
	static let controllerIdentifier = String(describing: LoginViewController.self)


	@IBOutlet weak var emailTextField: UITextField!

	@IBOutlet weak var passwordTextField: UITextField!


	override func viewDidLoad() {
		super.viewDidLoad()
		loadViewIfNeeded()
		view.layoutIfNeeded()
		navigationController?.navigationBar.prefersLargeTitles = true
		title = "Sign In"


	}
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		emailTextField.placeholder = "Email Address"
		emailTextField.layer.borderWidth = 1
		emailTextField.layer.borderColor = UIColor.label.cgColor
		emailTextField.backgroundColor = .white
		emailTextField.leftViewMode = .always
		emailTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))

		passwordTextField.placeholder = "Password"
		passwordTextField.isSecureTextEntry = true
		passwordTextField.layer.borderWidth = 1
		passwordTextField.backgroundColor = .white
		passwordTextField.layer.borderColor = UIColor.label.cgColor
		passwordTextField.leftViewMode = .always
		passwordTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
	}


	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(true)
		emailTextField.becomeFirstResponder()
	}

	@IBAction func nextButtonPressed(_ sender: UIButton) {
		guard let email = emailTextField.text, !email.isEmpty, let password = passwordTextField.text, !password.isEmpty else {
			let alert = UIAlertController(title: "Failed to Log In", message: "please enter all the details.", preferredStyle: .alert)
			alert.addAction(UIAlertAction(title: "Dismiss", style: .default))
			present(alert, animated: true)
			return
		}

		FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password) {[weak self] result, error in

			guard let strongSelf = self else {
				return
			}
			guard error == nil else {
//				print(error)
				let alert = UIAlertController(title: "Failed to Log In", message: error?.localizedDescription, preferredStyle: .alert)
				alert.addAction(UIAlertAction(title: "Ok", style: .default))
				strongSelf.present(alert, animated: true)

				return
			}

			strongSelf.emailTextField.resignFirstResponder()
			strongSelf.passwordTextField.resignFirstResponder()

			let vc = strongSelf.storyboard?.instantiateViewController(withIdentifier: HomeViewController.controllerIdentifier) as! HomeViewController
			vc.modalPresentationStyle = .fullScreen
			vc.modalTransitionStyle  = .flipHorizontal
			strongSelf.present(vc,animated: true,completion: nil)


		}
	}

	@IBAction func goToRegisterScreenButton(_ sender: UIButton) {
		print("pressed")
		let storyboard = UIStoryboard(name: "Main", bundle: nil)
		let vc = storyboard.instantiateViewController(withIdentifier: RegistrationViewController.controllerIdentifier)
		self.present(vc, animated: true)
//		navigationController?.pushViewController(vc, animated: true)
//
//		let vc = storyboard?.instantiateViewController(withIdentifier: RegistrationViewController.controllerIdentifier) as! RegistrationViewController
//		vc.navigationItem.largeTitleDisplayMode = .always
//		navigationController?.pushViewController(vc, animated: true)

	}

}


extension LoginViewController {

}
