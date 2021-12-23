//
//  MangaGenreService.swift
//  OTUSHW2
//
//  Created by Дмитрий Мальцев on 16.12.2021.
//

import SwiftUI
import Combine

class MangaGenreService {
    @Published var mangaList: [Manga] = []
    private var subscriptions: AnyCancellable?
    
    public func getManga(genre: GenreManga = .action, page: Int = 1) {
        guard let url = URL(string: "https://api.jikan.moe/v3/genre/manga/\(genre.rawValue)/\(page)") else { return }
        subscriptions = NetworkingManager.download(url: url)
            .handleEvents(receiveCompletion: {
                [weak self] completion in
                switch completion {
                case .finished:
                    break
                case .failure(_):
                    self?.mangaList = []
                }
            })
            .decode(type: Genre.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] genre in
                self?.mangaList = genre.manga ?? []
                self?.subscriptions?.cancel()
            })
    }
}
