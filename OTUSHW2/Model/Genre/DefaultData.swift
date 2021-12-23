//
//  DefaultData.swift
//  OTUSHW2
//
//  Created by Дмитрий Мальцев on 16.12.2021.
//

import SwiftUI

struct DefaultData: Codable, Hashable {
    let id: Int?
    let type: String?
    let name: String?
    let url: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "mal_id"
        case type, name, url
    }
}
