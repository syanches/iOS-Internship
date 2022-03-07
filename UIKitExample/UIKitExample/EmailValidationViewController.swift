//
//  EmailValidationViewController.swift
//  UIKitExample
//
//  Created by Artem Martirosyan on 06.03.2022.
//

import Foundation
import UIKit

class EmailValidationViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    override func loadView() {
        view = ValidationCardView(validationType: .email)
    }
}

extension EmailValidationViewController {
    private func configureView() {
        navigationItem.title = "Валидация почты"
    }
}

