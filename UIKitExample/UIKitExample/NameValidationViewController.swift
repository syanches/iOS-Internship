//
//  NameValidationViewController.swift
//  UIKitExample
//
//  Created by Artem Martirosyan on 07.03.2022.
//

import Foundation
import UIKit

class NameValidationViewController: UIViewController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        view = ValidationCardView(validationType: .name)
    }
}
