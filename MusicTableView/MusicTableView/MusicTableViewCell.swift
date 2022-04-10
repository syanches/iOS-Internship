//
//  MusicTableViewCell.swift
//  MusicTableView
//
//  Created by Artem Martirosyan on 12.03.2022.
//

import Foundation
import UIKit

final class MusicTableViewCell: UITableViewCell {
    lazy var musicImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 14
        return imageView
    }()
    
    lazy var musicAlbumTitle: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.numberOfLines = 0
        title.font = UIFont.systemFont(ofSize: 24)
        return title
    }()
    
    lazy var musicRatingLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    lazy var musicButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Buy", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 8
        button.contentEdgeInsets = UIEdgeInsets(top: 5, left: 15, bottom: 5, right: 15)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        initCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(albumTitle: String, albumRating: String) {
        musicAlbumTitle.text = albumTitle
        musicImageView.image = UIImage(named: albumTitle)
        musicRatingLabel.text = String(repeating: "⭐️", count: Int(albumRating) ?? 0)
    }
}

extension MusicTableViewCell {
    private func initCell() {
        contentView.addSubview(musicImageView)
        contentView.addSubview(musicAlbumTitle)
        contentView.addSubview(musicRatingLabel)
        contentView.addSubview(musicButton)
                
        NSLayoutConstraint.activate([
            musicImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            musicImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            musicImageView.widthAnchor.constraint(equalToConstant: 75),
            musicImageView.heightAnchor.constraint(equalToConstant: 75),
            musicImageView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -20),

            musicAlbumTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            musicAlbumTitle.leadingAnchor.constraint(equalTo: musicImageView.trailingAnchor, constant: 20),
            musicAlbumTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),

            musicRatingLabel.topAnchor.constraint(equalTo: musicAlbumTitle.bottomAnchor, constant: 20),
            musicRatingLabel.leadingAnchor.constraint(equalTo: musicImageView.trailingAnchor, constant: 20),
            musicRatingLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            musicRatingLabel.trailingAnchor.constraint(lessThanOrEqualTo: musicButton.leadingAnchor, constant: -20),

            musicButton.topAnchor.constraint(equalTo: musicAlbumTitle.bottomAnchor, constant: 25),
            musicButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            musicButton.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -20)
        ])
    }
}
