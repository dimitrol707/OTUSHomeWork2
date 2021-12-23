//
//  Character.swift
//  OTUSHW2
//
//  Created by Дмитрий Мальцев on 21.12.2021.
//

import SwiftUI

struct ProductCharacterData: Codable {
    let characters: [CharacterData]
    enum CodingKeys: String, CodingKey {
        case characters
    }
}
