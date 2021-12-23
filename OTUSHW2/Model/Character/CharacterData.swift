//
//  CharacterData.swift
//  OTUSHW2
//
//  Created by Дмитрий Мальцев on 22.12.2021.
//

import SwiftUI

struct CharacterData: Codable, Identifiable {
    var id: Int?
    var url: String?
    var name: String?
    var about: String?
    var memberFavorites: Int?
    var imageUrl: String?
    var animeography: [ProductOgraphy]?
    var mangaography: [ProductOgraphy]?
    var voiceActors: [VoiceActor]?
    
    enum CodingKeys: String, CodingKey {
        case id = "mal_id"
        case name, url, about
        case memberFavorites = "member_favorites"
        case imageUrl = "image_url"
        case animeography, mangaography
        case voiceActors = "voice_actors"
    }
}
