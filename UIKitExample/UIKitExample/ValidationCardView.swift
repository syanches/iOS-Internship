//
//  ValidationCardView.swift
//  UIKitExample
//
//  Created by Artem Martirosyan on 07.03.2022.
//

import Foundation
import UIKit

class ValidationCardView: UIView {
    
    let validationType: ValidationType
    
    init(validationType: ValidationType) {
        self.validationType = validationType
        super.init(frame: .zero)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var validationCardView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .secondarySystemBackground
        view.layer.cornerRadius = 12
        return view
    }()
    
    private lazy var validationTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = validationType == .email ? "Введите email..." : "Введите имя и фамилию"
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .systemBackground
        return textField
    }()
    
    private lazy var validationButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Валидировать", for: .normal)
        button.setTitle("Не дави на меня!", for: .highlighted)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 4
        button.addTarget(self, action: #selector(didTapValidationButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var validationResultLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Ожидаю валидации..."
        return label
    }()
    
    private func configureView() {
        backgroundColor = .systemBackground
        addSubview(validationCardView)
        validationCardView.addSubview(validationTextField)
        validationCardView.addSubview(validationButton)
        validationCardView.addSubview(validationResultLabel)
        
        
        NSLayoutConstraint.activate([
            validationCardView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            validationCardView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            validationCardView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            validationTextField.topAnchor.constraint(equalTo: validationCardView.topAnchor, constant: 16),
            validationTextField.leadingAnchor.constraint(equalTo: validationCardView.leadingAnchor, constant: 16),
            validationTextField.trailingAnchor.constraint(equalTo: validationCardView.trailingAnchor, constant: -16),
            
            
            validationButton.topAnchor.constraint(equalTo: validationTextField.bottomAnchor, constant: 16),
            validationButton.leadingAnchor.constraint(equalTo: validationCardView.leadingAnchor, constant: 16),
            validationButton.trailingAnchor.constraint(equalTo: validationCardView.trailingAnchor, constant: -16),
            
            validationResultLabel.topAnchor.constraint(equalTo: validationButton.bottomAnchor, constant: 16),
            validationResultLabel.leadingAnchor.constraint(equalTo: validationCardView.leadingAnchor, constant: 16),
            validationResultLabel.trailingAnchor.constraint(equalTo: validationCardView.trailingAnchor, constant: -16),
            validationResultLabel.bottomAnchor.constraint(equalTo: validationCardView.bottomAnchor, constant: -16)
        ])
    }
}

extension ValidationCardView {
    enum ValidationType {
        case email
        case name
    }
    
    @objc
    private func didTapValidationButton() {
        let regExString = validationType == .name ?  "[A-Za-zА-ЯЁа-яё-]{2,}+\\s{1}+[A-Za-zА-ЯЁа-яё-]{2,}" : "[A-Za-z0-9%.+_-]+@[A-Za-z0-9%.+_-]+\\.[A-Za-z]{2,4}"
        let predicate = NSPredicate(format: "SELF MATCHES[c] %@", regExString)
        let isValid = predicate.evaluate(with: validationTextField.text)
        
        validationResultLabel.text = isValid ? "Валидация прошла успешно" : "В поле ошибка"
        validationResultLabel.textColor = isValid ? .systemGreen : .systemRed
    }
}
