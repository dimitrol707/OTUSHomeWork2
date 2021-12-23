//
//  ProductOgraphy.swift
//  OTUSHW2
//
//  Created by Дмитрий Мальцев on 22.12.2021.
//

import SwiftUI

struct ProductOgraphy: Codable {
    var id: Int?
    var name: String?
    var url: String?
    var imageUrl: String?
    var role: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "mal_id"
        case name, url
        case imageUrl = "image_url"
        case role
    }
}

