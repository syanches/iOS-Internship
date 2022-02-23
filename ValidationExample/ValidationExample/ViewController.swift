//
//  ViewController.swift
//  ValidationExample
//
//  Created by Artem Martirosyan on 23.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var nameValidationCardView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .secondarySystemBackground
        view.layer.cornerRadius = 12
        return view
    }()
    
    private lazy var nameValidationTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Введите имя..."
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .systemBackground
        return textField
    }()
    
    private lazy var nameValidationButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Валидировать", for: .normal)
        button.setTitle("Не дави на меня!", for: .highlighted)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 4
        button.addTarget(self, action: #selector(didTapNameValidationButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var nameValidationResultLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Ожидаю валидации..."
        return label
    }()
    
    private lazy var emailValidationCardView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .secondarySystemBackground
        view.layer.cornerRadius = 12
        return view
    }()
    
    private lazy var emailValidationTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .systemBackground
        textField.borderStyle = .roundedRect
        textField.placeholder = "Введите электронную почту..."
        textField.keyboardType = .emailAddress
        return textField
    }()
    
    private lazy var emailValidationButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 4
        button.setTitle("Валидировать", for: .normal)
        button.setTitle("Опять ты давишь...", for: .highlighted)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        button.addTarget(self, action: #selector(didTapEmailValidationButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var emailValidationResultLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Ожидаю валидации..."
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
}

// MARK: - Private methods
extension ViewController {
    private func configureView() {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBackground
        
        view.addSubview(nameValidationCardView)
        nameValidationCardView.addSubview(nameValidationTextField)
        nameValidationCardView.addSubview(nameValidationButton)
        nameValidationCardView.addSubview(nameValidationResultLabel)
        
        view.addSubview(emailValidationCardView)
        emailValidationCardView.addSubview(emailValidationTextField)
        emailValidationCardView.addSubview(emailValidationButton)
        emailValidationCardView.addSubview(emailValidationResultLabel)
        
        NSLayoutConstraint.activate([
            nameValidationCardView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            nameValidationCardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameValidationCardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            nameValidationTextField.topAnchor.constraint(equalTo: nameValidationCardView.topAnchor, constant: 16),
            nameValidationTextField.leadingAnchor.constraint(equalTo: nameValidationCardView.leadingAnchor, constant: 16),
            nameValidationTextField.trailingAnchor.constraint(equalTo: nameValidationCardView.trailingAnchor, constant: -16),
            
            
            nameValidationButton.topAnchor.constraint(equalTo: nameValidationTextField.bottomAnchor, constant: 16),
            nameValidationButton.leadingAnchor.constraint(equalTo: nameValidationCardView.leadingAnchor, constant: 16),
            nameValidationButton.trailingAnchor.constraint(equalTo: nameValidationCardView.trailingAnchor, constant: -16),
            
            nameValidationResultLabel.topAnchor.constraint(equalTo: nameValidationButton.bottomAnchor, constant: 16),
            nameValidationResultLabel.leadingAnchor.constraint(equalTo: nameValidationCardView.leadingAnchor, constant: 16),
            nameValidationResultLabel.trailingAnchor.constraint(equalTo: nameValidationCardView.trailingAnchor, constant: -16),
            nameValidationResultLabel.bottomAnchor.constraint(equalTo: nameValidationCardView.bottomAnchor, constant: -16),
            
            emailValidationCardView.topAnchor.constraint(equalTo: nameValidationCardView.bottomAnchor, constant: 32),
            emailValidationCardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            emailValidationCardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            emailValidationTextField.topAnchor.constraint(equalTo: emailValidationCardView.topAnchor, constant: 16),
            emailValidationTextField.leadingAnchor.constraint(equalTo: emailValidationCardView.leadingAnchor, constant: 16),
            emailValidationTextField.trailingAnchor.constraint(equalTo: emailValidationCardView.trailingAnchor, constant: -16),
            
            emailValidationButton.topAnchor.constraint(equalTo: emailValidationTextField.bottomAnchor, constant: 16),
            emailValidationButton.leadingAnchor.constraint(equalTo: emailValidationCardView.leadingAnchor, constant: 16),
            emailValidationButton.trailingAnchor.constraint(equalTo: emailValidationCardView.trailingAnchor, constant: -16),
            
            emailValidationResultLabel.topAnchor.constraint(equalTo: emailValidationButton.bottomAnchor, constant: 16),
            emailValidationResultLabel.leadingAnchor.constraint(equalTo: emailValidationCardView.leadingAnchor, constant: 16),
            emailValidationResultLabel.trailingAnchor.constraint(equalTo: emailValidationCardView.trailingAnchor, constant: -16),
            emailValidationResultLabel.bottomAnchor.constraint(equalTo: emailValidationCardView.bottomAnchor, constant: -16)
        ])
    }
    
    @objc
    private func didTapNameValidationButton() {
        let regExString = "[A-Za-zА-ЯЁа-яё-]{2,}+\\s{1}+[A-Za-zА-ЯЁа-яё-]{2,}"
        let predicate = NSPredicate(format: "SELF MATCHES[c] %@", regExString)
        let isValid = predicate.evaluate(with: nameValidationTextField.text)
        
        nameValidationResultLabel.text = isValid ? "Валидация прошла успешно" : "В поле ошибка"
        nameValidationResultLabel.textColor = isValid ? .systemGreen : .systemRed
    }
    
    @objc
    private func didTapEmailValidationButton() {
        
        let regExString = "[A-Za-z0-9%.+-_]+@[A-Za-z0-9%.+-_]+\\.[A-Za-z]{2,4}"
        let predicate = NSPredicate(format: "SELF MATCHES[c] %@", regExString)
        let isValid = predicate.evaluate(with: emailValidationTextField.text)
        
        emailValidationResultLabel.text = isValid ? "Валидация прошла успешно" : "В поле ошибка"
        emailValidationResultLabel.textColor = isValid ? .systemGreen : .systemRed
        
    }
}

