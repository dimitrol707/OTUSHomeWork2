//
//  AnimeCharacterService.swift
//  OTUSHW2
//
//  Created by Дмитрий Мальцев on 22.12.2021.
//

import SwiftUI
import Combine

class AnimeCharacterService: ProductCharacterService {
    @Published var characterList: [CharacterData] = []
    var list: Published<[CharacterData]>.Publisher { $characterList }
    
    private var subscriptions: AnyCancellable?
    
    private let anime: Anime
    
    init(anime: Anime) {
        self.anime = anime
        getCharacters()
    }
    
    public func getCharacters() {
        guard let id = anime.id,
              let url = URL(string: "https://api.jikan.moe/v3/anime/\(id)/characters_staff") else { return }
        subscriptions = NetworkingManager.download(url: url)
            .handleEvents(receiveCompletion: {
                [weak self] completion in
                switch completion {
                case .finished:
                    break
                case .failure(_):
                    self?.characterList = []
                }
            })
            .decode(type: ProductCharacterData.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] characterData in
                self?.characterList = characterData.characters
                self?.subscriptions?.cancel()
            })
    }
}

