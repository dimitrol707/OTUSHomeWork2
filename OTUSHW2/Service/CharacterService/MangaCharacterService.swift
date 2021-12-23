//
//  MangaCharacterService.swift
//  OTUSHW2
//
//  Created by Дмитрий Мальцев on 21.12.2021.
//

import SwiftUI
import Combine

class MangaCharacterService: ProductCharacterService {
    @Published var characterList: [CharacterData] = []
    var list: Published<[CharacterData]>.Publisher { $characterList }
    
    private var subscriptions: AnyCancellable?
    
    private let manga: Manga
    
    init(manga: Manga) {
        self.manga = manga
        getCharacters()
    }
    
    public func getCharacters() {
        guard let id = manga.id,
              let url = URL(string: "https://api.jikan.moe/v3/manga/\(id)/characters") else { return }
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
