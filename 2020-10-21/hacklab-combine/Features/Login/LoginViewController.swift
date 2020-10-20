//
//  LoginViewController.swift
//  hacklab-combine
//
//  Created by Michal Cichecki on 20/10/2020.
//

import UIKit
import Combine

class LoginViewController: UIViewController {
    private lazy var contentView = LoginView()
    private let viewModel: LoginViewModel
    private var cancellables = Set<AnyCancellable>()
    
    init(viewModel: LoginViewModel = LoginViewModel()) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpBindings()
        contentView.loginButton.addTarget(self, action: #selector(navigateToSecondScreen), for: .touchUpInside)
    }
    
    private func setUpBindings() {
        func bindViewToViewModel() {
            contentView.loginTextField.textPublisher
                .assign(to: \.login, on: viewModel)
                .store(in: &cancellables)
            
            contentView.passwordTextField.textPublisher
                .assign(to: \.password, on: viewModel)
                .store(in: &cancellables)
        }
        
        func bindViewModelToView() {
            viewModel.isValid
                .assign(to: \.isValid, on: contentView.loginButton)
                .store(in: &cancellables)
        }
        
        bindViewToViewModel()
        bindViewModelToView()
    }
    
    @objc private func navigateToSecondScreen() {
        let emptyVC = EmptyViewController()
        navigationController?.pushViewController(emptyVC, animated: true)
    }
}
