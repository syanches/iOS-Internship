//
//  MusicTableViewCellModel.swift
//  MusicTableView
//
//  Created by Artem Martirosyan on 12.03.2022.
//

import Foundation

struct MusicTableViewCellModel {
    let albumTitle: String
    let albumRating: String
    
    static func loadSampleData() -> [[MusicTableViewCellModel]] {
        [
            [
            MusicTableViewCellModel(albumTitle: "Nevermind", albumRating: "5"),
            MusicTableViewCellModel(albumTitle: "Purple Rain", albumRating: "2"),
            MusicTableViewCellModel(albumTitle: "Blood on the Tracks", albumRating: "4"),
            MusicTableViewCellModel(albumTitle: "Abbey Road", albumRating: "5")
            ],
            [
            MusicTableViewCellModel(albumTitle: "Goodbye Yellow Brick", albumRating: "5"),
            MusicTableViewCellModel(albumTitle: "Endless", albumRating: "2"),
            MusicTableViewCellModel(albumTitle: "Thriller", albumRating: "4"),
            ],
            [
            MusicTableViewCellModel(albumTitle: "DAMN", albumRating: "5"),
            MusicTableViewCellModel(albumTitle: "IGOR", albumRating: "3"),
            MusicTableViewCellModel(albumTitle: "ASTROWORLD", albumRating: "5"),
            ],
            [
            MusicTableViewCellModel(albumTitle: "Illmatic", albumRating: "4"),
            MusicTableViewCellModel(albumTitle: "Ready to Die", albumRating: "4"),
            MusicTableViewCellModel(albumTitle: "The Chronic", albumRating: "5"),
            ]
        ]
    }
}
