//
//  ProductItemViewModel.swift
//  OTUSHW2
//
//  Created by Дмитрий Мальцев on 21.12.2021.
//

import SwiftUI
import Combine

class ProductItemViewModel: ObservableObject {
    @Published var characterList: [CharacterData] = []
    @Published var isLoading: Bool = false
    
    private var product: Product
    private var characterService: ProductCharacterService?

    private var cancellables = Set<AnyCancellable>()
    
    init(product: Product) {
        self.product = product
        if let manga = product as? Manga {
            characterService = MangaCharacterService(manga: manga)
            self.addSubsribers()
        } else if let anime = product as? Anime {
            characterService = AnimeCharacterService(anime: anime)
            self.addSubsribers()
        }
        self.isLoading = true
    }
    
    private func addSubsribers() {
        guard characterService != nil else { return }
        characterService!.list
            .handleEvents(receiveOutput: {
                [weak self] _ in
                self?.isLoading = false
            })
            .sink(receiveValue: {
                [weak self] characters in
                guard let self = self else { return }
                self.characterList = characters
            })
            .store(in: &cancellables)
    }
}
