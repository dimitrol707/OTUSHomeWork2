//
//  CharacterItemViewModel.swift
//  OTUSHW2
//
//  Created by Дмитрий Мальцев on 22.12.2021.
//

import SwiftUI
import Combine

class CharacterItemViewModel: ObservableObject {
    @Published var character: CharacterData?
    @Published var isLoading: Bool = false
    
    private var idCharacter: Int
    private var characterService: CharacterService

    private var cancellables = Set<AnyCancellable>()
    
    init(idCharacter: Int) {
        self.idCharacter = idCharacter
        self.characterService = .init(idCharacter: idCharacter)
        self.addSubsribers()
        self.isLoading = true
    }
    
    private func addSubsribers() {
        characterService.$characterData
            .handleEvents(receiveOutput: {
                [weak self] _ in
                self?.isLoading = false
            })
            .sink(receiveValue: {
                [weak self] character in
                guard let self = self else { return }
                self.character = character
            })
            .store(in: &cancellables)
    }
}
