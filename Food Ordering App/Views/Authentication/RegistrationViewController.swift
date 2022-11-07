//
//  RegistrationViewController.swift
//  Food Ordering App
//
//  Created by Anisha Lamichhane on 07/11/2022.
//

import UIKit
import FirebaseAuth

class RegistrationViewController: UIViewController {
	static let controllerIdentifier = String(describing: RegistrationViewController.self)


	@IBOutlet weak var usernameTextField: UITextField!

	@IBOutlet weak var emailTextField: UITextField!


	@IBOutlet weak var passwordTextField: UITextField!



    override func viewDidLoad() {
        super.viewDidLoad()

    }

	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		usernameTextField.placeholder = "Username"
		usernameTextField.layer.borderWidth = 1
		usernameTextField.layer.borderColor = UIColor.label.cgColor
		usernameTextField.backgroundColor = .white
		usernameTextField.leftViewMode = .always
		usernameTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))

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

	
    
	@IBAction func signUpButtonPressed(_ sender: UIButton) {
		guard let username = usernameTextField.text, !username.isEmpty, let email = emailTextField.text, !email.isEmpty, let password = passwordTextField.text, !password.isEmpty else {
			let alert = UIAlertController(title: "Failed to Create User", message: "Please enter al the details.", preferredStyle: .alert)
			alert.addAction(UIAlertAction(title: "Dismiss", style: .default))
			present(alert, animated: true)
			
			return
		}
		FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password) {[weak self] Result, error in
			guard let strongSelf = self else {
				return
			}
			guard error == nil else {
//				print(error)
				let alert = UIAlertController(title: "Failed to create user.", message: error?.localizedDescription, preferredStyle: .alert)
				alert.addAction(UIAlertAction(title: "Dismiss", style: .default))
				strongSelf.present(alert, animated: true)

				return
			}

//			print("you have registered")

			let vc = strongSelf.storyboard?.instantiateViewController(withIdentifier: LoginViewController.controllerIdentifier) as! LoginViewController
//			vc.navigationItem.largeTitleDisplayMode = .always
			strongSelf.navigationController?.pushViewController(vc, animated: true)
		}




	}

	@IBAction func goToSignInButtonPressed(_ sender: UIButton) {
		navigationController?.popToRootViewController(animated: true)
	}


}
