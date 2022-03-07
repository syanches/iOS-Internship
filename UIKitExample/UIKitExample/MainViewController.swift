//
//  ViewController.swift
//  UIKitExample
//
//  Created by Artem Martirosyan on 03.03.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    private lazy var emailValidationButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Перейти к валидации почты", for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 4
        button.addTarget(self, action: #selector(didTapValidationButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var nameValidationButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Перейти к валидации имени", for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 4
        button.addTarget(nil, action: #selector(didTapValidationButton), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
}

extension MainViewController {
    private func configureView() {
        view.backgroundColor = .systemBackground
        view.addSubview(emailValidationButton)
        view.addSubview(nameValidationButton)
        
        NSLayoutConstraint.activate([
            
            emailValidationButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 300),
            emailValidationButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            emailValidationButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            
            nameValidationButton.topAnchor.constraint(equalTo: emailValidationButton.bottomAnchor, constant: 20),
            nameValidationButton.leadingAnchor.constraint(equalTo: emailValidationButton.leadingAnchor),
            nameValidationButton.trailingAnchor.constraint(equalTo: emailValidationButton.trailingAnchor),
            
        ])
    }
    
    @objc
    private func didTapValidationButton(sender: UIButton) {
        switch sender {
        case emailValidationButton:
            navigationController?.pushViewController(EmailValidationViewController(), animated: true)
        case nameValidationButton:
            navigationController?.present(NameValidationViewController(), animated: true)
        default:
            return
        }
    }
}
