//
//  LoginView.swift
//  hacklab-combine
//
//  Created by Michal Cichecki on 20/10/2020.
//

import UIKit

final class LoginView: UIView {
    lazy var loginTextField = UITextField()
    lazy var passwordTextField = UITextField()
    lazy var loginButton = UIButton()
    
    init() {
        super.init(frame: .zero)
        
        addSubviews()
        setUpConstraints()
        setUpStyling()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        [loginTextField, passwordTextField, loginButton]
            .forEach {
                addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
            }
    }
    
    private func setUpConstraints() {
        let loginConstraints = [
            loginTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            loginTextField.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -30.0),
            loginTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40.0),
            loginTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40.0),
            loginTextField.heightAnchor.constraint(equalToConstant: 30.0)
        ]
        
        let passwordConstraints = [
            passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 10.0),
            passwordTextField.centerXAnchor.constraint(equalTo: loginTextField.centerXAnchor),
            passwordTextField.widthAnchor.constraint(equalTo: loginTextField.widthAnchor, multiplier: 1.0),
            passwordTextField.heightAnchor.constraint(equalTo: loginTextField.heightAnchor)
        ]
        
        let loginButtonConstraints = [
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20.0),
            loginButton.centerXAnchor.constraint(equalTo: loginTextField.centerXAnchor),
            loginButton.widthAnchor.constraint(equalToConstant: 120.0),
            loginButton.heightAnchor.constraint(equalToConstant: 30.0)
        ]
        
        [loginConstraints, passwordConstraints, loginButtonConstraints]
            .forEach(NSLayoutConstraint.activate)
    }
    
    private func setUpStyling() {
        backgroundColor = .white
        
        [loginTextField, passwordTextField].forEach {
            $0.backgroundColor = .white
            $0.textColor = .darkGray
            $0.layer.borderColor = UIColor.darkGray.cgColor
            $0.layer.borderWidth = 1.0
        }
        
        loginTextField.placeholder = "login"
        passwordTextField.placeholder = "password"
        loginButton.setTitle("Log in", for: UIControl.State())
        loginButton.setTitleColor(.white, for: UIControl.State())
        loginButton.backgroundColor = .red
    }
}

