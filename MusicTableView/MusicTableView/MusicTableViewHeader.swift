//
//  MusicTableViewHeader.swift
//  MusicTableView
//
//  Created by Artem Martirosyan on 10.04.2022.
//

import Foundation
import UIKit

final class MusicTableViewHeader: UITableViewHeaderFooterView {
        
    private var buttonTappedCallback:((_ tag: Int) -> Void)?
    
    private lazy var titile: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 38, weight: .bold)
        return label
    }()
    
    private lazy var button: UIButton = {
        let btn = UIButton(type: .custom)
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 32, weight: .bold)
        let image = UIImage(systemName: "arrow.up", withConfiguration: largeConfig)
        btn.tintColor = .black
        btn.setImage(image, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        return btn
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        initCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureHeader(title: String, buttonTag: Int, buttonTappedCallback: @escaping((_ tag: Int) -> Void)) {
        titile.text = title
        button.tag = buttonTag
        self.buttonTappedCallback = buttonTappedCallback
    }
}

extension MusicTableViewHeader {
    private func initCell() {
        addSubview(titile)
        addSubview(button)
        
        NSLayoutConstraint.activate([
            titile.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            titile.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
            button.topAnchor.constraint(equalTo: titile.topAnchor),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
        ])
    }
    
    @objc
    private func didTapButton(_ sender: UIButton) {
        let i = sender.tag
        UIView.animate(withDuration: 0.5) {
            self.button.transform = self.button.transform.rotated(by: .pi)
        }
        buttonTappedCallback?(i)
    }
}

