//
//  LoginViewController.swift
//  Loginpage
//
//  Created by Praveen on 19/05/25.
//

import UIKit

class LoginViewController: UIViewController {
    private let viewModel = LoginViewModel()

    @IBOutlet weak var UsernameTF: UITextField!
    
    @IBOutlet weak var PasswordTF: UITextField!
    @IBAction func login(_ sender: Any) {
        let username = UsernameTF.text ?? ""
                let password = PasswordTF.text ?? ""
        viewModel.login(username: username, password: password) { [weak self] success in
                guard let self = self else { return }
            if success {
                print("Login successful")
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                if let homeVC = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController {
                    self.navigationController?.pushViewController(homeVC, animated: true)
                   // self.present(homeVC, animated: true)
                }
            } else {
                print("Login failed:")
            }
            }
    }
    
    @IBOutlet weak var LoginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindTextFields()
        LoginButton.isEnabled = false
       
    }
    private func bindTextFields() {
        UsernameTF.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        PasswordTF.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        }

    @objc private func textFieldChanged() {
        viewModel.user.email = UsernameTF.text ?? ""
        viewModel.user.password = PasswordTF.text ?? ""
        LoginButton.isEnabled = viewModel.isLoginEnabled
        }

}
