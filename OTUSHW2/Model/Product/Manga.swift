//
//  Manga.swift
//  OTUSHW2
//
//  Created by Дмитрий Мальцев on 16.12.2021.
//

import SwiftUI

struct Manga: Identifiable, Codable, Product {
    var id: Int?
    var url: String?
    var title: String?
    var imageUrl: String?
    var synopsis: String?
    var type: String?
    var members: Int?
    var genres: [DefaultData]?
    var explicitGenres: [DefaultData]?
    var themes: [DefaultData]?
    var score: Double?
    
    // Manga Properties
    var publishingStart: String?
    var volumes: Int?
    var authors: [DefaultData]?
    
    enum CodingKeys: String, CodingKey {
        case id = "mal_id"
        case url, title
        case imageUrl = "image_url"
        case synopsis, type
        case publishingStart = "publishing_start"
        case volumes, members, genres
        case explicitGenres = "explicit_genres"
        case themes, authors, score
    }
}
