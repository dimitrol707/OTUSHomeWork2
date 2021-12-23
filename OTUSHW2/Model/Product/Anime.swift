//
//  Anime.swift
//  OTUSHW2
//
//  Created by Дмитрий Мальцев on 16.12.2021.
//

import SwiftUI

struct Anime: Identifiable, Codable, Product {
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
    
    // Anime Properties
    var airingStart: String?
    var episodes: Int?
    var source: String?
    var producers: [DefaultData]?
    
    enum CodingKeys: String, CodingKey {
        case id = "mal_id"
        case url, title
        case imageUrl = "image_url"
        case synopsis, type
        case airingStart = "airing_start"
        case episodes, members, genres
        case explicitGenres = "explicit_genres"
        case themes, source, producers, score
    }
}



