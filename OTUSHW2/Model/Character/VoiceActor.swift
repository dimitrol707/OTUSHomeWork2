//
//  VoiceActor.swift
//  OTUSHW2
//
//  Created by Дмитрий Мальцев on 21.12.2021.
//

import SwiftUI

struct VoiceActor: Codable {
    let id: Int?
    let name: String?
    let url: String?
    let imageUrl: String?
    let language: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "mal_id"
        case name, url
        case imageUrl = "image_url"
        case language
    }
}
