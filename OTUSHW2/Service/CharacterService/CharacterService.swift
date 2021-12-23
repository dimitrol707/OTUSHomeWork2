//
//  CharacterService.swift
//  OTUSHW2
//
//  Created by Дмитрий Мальцев on 22.12.2021.
//

import SwiftUI
import Combine

class CharacterService {
    @Published var characterData: CharacterData?
    
    private var subscriptions: AnyCancellable?
    
    private let idCharacter: Int
    
    init(idCharacter: Int) {
        self.idCharacter = idCharacter
        getCharacter()
    }
    
    public func getCharacter() {
        guard let url = URL(string: "https://api.jikan.moe/v3/character/\(idCharacter)") else { return }
        subscriptions = NetworkingManager.download(url: url)
            .handleEvents(receiveCompletion: {
                [weak self] completion in
                switch completion {
                case .finished:
                    break
                case .failure(_):
                    self?.characterData = nil
                }
            })
            .decode(type: CharacterData.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] characterData in
                self?.characterData = characterData
                self?.subscriptions?.cancel()
            })
    }
}
