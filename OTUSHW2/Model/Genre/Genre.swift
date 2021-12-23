//
//  Genre.swift
//  OTUSHW2
//
//  Created by Дмитрий Мальцев on 16.12.2021.
//

import SwiftUI

struct Genre: Codable {
    let genreType: DefaultData
    let itemCount: Int
    let anime: [Anime]?
    let manga: [Manga]?
    enum CodingKeys: String, CodingKey {
        case genreType = "mal_url"
        case itemCount = "item_count"
        case anime, manga
    }
}

// MARK: - GenreAnime
enum GenreAnime: Int, CaseIterable, Comparable {
    case action = 1
    case adventure
    case cars
    case comedy
    case avanteGarde
    case demons
    case mystery
    case drama
    case ecchi
    case fantasy
    case game
    case hentai
    case historical
    case horror
    case kids
    case martialArts = 17
    case mecha
    case music
    case parody
    case samurai
    case romance
    case school
    case sciFi
    case shoujo
    case girlsLove
    case shounen
    case boysLove
    case space
    case sports
    case superPower
    case vampire
    case harem = 35
    case sliceOfLife
    case supernatural
    case military
    case police
    case psychological
    case suspense
    case seinen
    case josei
    case awardWinning = 46
    case gourmet
    case workLife
    case erotica
    
    func toString() -> String {
        switch self {
        case .action: return "Action"
        case .adventure: return "Adventure"
        case .cars: return "Cars"
        case .comedy: return "Comedy"
        case .avanteGarde: return "Avante Garde"
        case .demons: return "Demons"
        case .mystery: return "Mystery"
        case .drama: return "Drama"
        case .ecchi: return "Ecchi"
        case .fantasy: return "Fantasy"
        case .game: return "Game"
        case .hentai: return "Hentai"
        case .historical: return "Historical"
        case .horror: return "Horror"
        case .kids: return "Kids"
        case .martialArts: return "Martial Arts"
        case .mecha: return "Mecha"
        case .music: return "Music"
        case .parody: return "Parody"
        case .samurai: return "Samurai"
        case .romance: return "Romance"
        case .school: return "School"
        case .sciFi: return "Sci-Fi"
        case .shoujo: return "Shoujo"
        case .girlsLove: return "Girls Love"
        case .shounen: return "Shounen"
        case .boysLove: return "Boys Love"
        case .space: return "Space"
        case .sports: return "Sports"
        case .superPower: return "Super Power"
        case .vampire: return "Vampire"
        case .harem: return "Harem"
        case .sliceOfLife: return "Slice Of Life"
        case .supernatural: return "Supernatual"
        case .military: return "Military"
        case .police: return "Police"
        case .psychological: return "Psychological"
        case .suspense: return "Suspense"
        case .seinen: return "Seinen"
        case .josei: return "Josei"
        case .awardWinning: return "Award Winning"
        case .gourmet: return "Gourmet"
        case .workLife: return "Work Life"
        case .erotica: return "Erotica"
        }
    }
    
    public static func < (a: GenreAnime, b: GenreAnime) -> Bool {
        return a.toString() < b.toString()
    }
}

// MARK: - GenreManga
enum GenreManga: Int, CaseIterable, Comparable {
    case action = 1
    case adventure
    case cars
    case comedy
    case avanteGarde
    case demons
    case mystery
    case drama
    case ecchi
    case fantasy
    case game
    case hentai
    case historical
    case horror
    case kids
    case martialArts = 17
    case mecha
    case music
    case parody
    case samurai
    case romance
    case school
    case sciFi
    case shoujo
    case girlsLove
    case shounen
    case boysLove
    case space
    case sports
    case superPower
    case vampire
    case harem = 35
    case sliceOfLife
    case supernatural
    case military
    case police
    case psychological
    case seinen
    case josei
    case doujinshi
    case genderBender
    case suspense
    case awardWinning
    case gourmet
    case workLife
    case erotica
    
    func toString() -> String {
        switch self {
        case .action: return "Action"
        case .adventure: return "Adventure"
        case .cars: return "Cars"
        case .comedy: return "Comedy"
        case .avanteGarde: return "Avante Garde"
        case .demons: return "Demons"
        case .mystery: return "Mystery"
        case .drama: return "Drama"
        case .ecchi: return "Ecchi"
        case .fantasy: return "Fantasy"
        case .game: return "Game"
        case .hentai: return "Hentai"
        case .historical: return "Historical"
        case .horror: return "Horror"
        case .kids: return "Kids"
        case .martialArts: return "Martial Arts"
        case .mecha: return "Mecha"
        case .music: return "Music"
        case .parody: return "Parody"
        case .samurai: return "Samurai"
        case .romance: return "Romance"
        case .school: return "School"
        case .sciFi: return "Sci-Fi"
        case .shoujo: return "Shoujo"
        case .girlsLove: return "Girls Love"
        case .shounen: return "Shounen"
        case .boysLove: return "Boys Love"
        case .space: return "Space"
        case .sports: return "Sports"
        case .superPower: return "Super Power"
        case .vampire: return "Vampire"
        case .harem: return "Harem"
        case .sliceOfLife: return "Slice Of Life"
        case .supernatural: return "Supernatual"
        case .military: return "Military"
        case .police: return "Police"
        case .psychological: return "Psychological"
        case .suspense: return "Suspense"
        case .seinen: return "Seinen"
        case .josei: return "Josei"
        case .doujinshi: return "Doujinshi"
        case .genderBender: return "Gender Bender"
        case .awardWinning: return "Award Winning"
        case .gourmet: return "Gourmet"
        case .workLife: return "Work Life"
        case .erotica: return "Erotica"
        }
    }
    
    public static func < (a: GenreManga, b: GenreManga) -> Bool {
        return a.toString() < b.toString()
    }
}
