//
//  ViewController.swift
//  ProteinCodeChallange
//
//  Created by Oğuzhan Kabul on 12.06.2023.
//

import UIKit

class LoginViewController: BaseViewController<LoginViewModel> {
    
    private let usernameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Username"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTargetToButtons()
        self.navigationItem.hidesBackButton = true
    }
    
    override func setupViews() {
        super.setupViews()
        [usernameTextField,
         loginButton].forEach({ view.addSubview( $0 )})
    }
    
    override func setupLayouts() {
        super.setupLayouts()
        NSLayoutConstraint.activate([
            usernameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            usernameTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            usernameTextField.widthAnchor.constraint(equalToConstant: 200),
            
            loginButton.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 20),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc func didTapLoginButton(_ sender: UIButton) {
        guard let username = usernameTextField.text, !username.isEmpty else {
            let alert = UIAlertController(title: "Hata", message: "Kullanıcı adı alanı boş olamaz", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Tamam", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        if viewModel.performLogin(with: username) {
            viewModel.pushDashboard()
        } else {
            let alert = UIAlertController(title: "Hata", message: "Geçersiz kullanıcı adı", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Tamam", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    private func addTargetToButtons() {
        loginButton.addTarget(self, action: #selector(didTapLoginButton(_:)), for: .touchUpInside)
    }
}

