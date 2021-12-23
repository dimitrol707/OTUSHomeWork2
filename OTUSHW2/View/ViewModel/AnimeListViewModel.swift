//
//  AnimeListViewModel.swift
//  OTUSHW2
//
//  Created by Дмитрий Мальцев on 20.12.2021.
//

import SwiftUI
import Combine

class AnimeListViewModel: ObservableObject {
    @Published var animeList: [Anime] = []
    @Published var selectionGenreAnime: GenreAnime = .action
    @Published var isLoading: Bool = false
    @Published var pageAnimeList: Int = 1
    @Published var isLastPage: Bool = false
    
    private var animeGenreService: AnimeGenreService = .init()
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubsribers()
    }
    
    private func addSubsribers() {
        animeGenreService.$animeList
            .handleEvents(receiveOutput: {
                [weak self] _ in
                self?.isLoading = false
            })
            .sink(receiveValue: {
                [weak self] animes in
                guard let self = self else { return }
                
                if animes.isEmpty {
                    self.isLastPage = true
                } else {
                    self.isLastPage = animes.count % 100 != 0
                }
                
                if self.animeList.isEmpty {
                    self.animeList = animes
                } else {
                    self.animeList.append(contentsOf: animes)
                }
                
            })
            .store(in: &cancellables)
        $selectionGenreAnime
            .debounce(for: .seconds(0.7), scheduler: DispatchQueue.main)
            .sink(receiveValue: {
                [weak self] genre in
                guard let self = self else { return }
                self.animeList = []
                self.pageAnimeList = 1
                self.isLastPage = false
                self.animeGenreService.getAnimes(genre: genre, page: self.pageAnimeList)
            })
            .store(in: &cancellables)
    }
    
    public func fetchNextPage() {
        guard isLoading, isLastPage == false else { return }
        pageAnimeList += 1
        self.animeGenreService.getAnimes(genre: selectionGenreAnime, page: pageAnimeList)
    }
}
