//
//  MangaListViewModel.swift
//  OTUSHW2
//
//  Created by Дмитрий Мальцев on 20.12.2021.
//

import SwiftUI
import Combine

class MangaListViewModel: ObservableObject {
    @Published var mangaList: [Manga] = []
    @Published var selectionGenreManga: GenreManga = .action
    @Published var isLoading: Bool = false
    @Published var pageMangaList: Int = 1
    @Published var isLastPage: Bool = false
    
    private var mangaGenreService: MangaGenreService = .init()
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubsribers()
    }
    
    private func addSubsribers() {
        mangaGenreService.$mangaList
            .handleEvents(receiveOutput: {
                [weak self] _ in
                self?.isLoading = false
            })
            .sink(receiveValue: {
                [weak self] manga in
                guard let self = self else { return }
                
                if manga.isEmpty {
                    self.isLastPage = true
                } else {
                    self.isLastPage = manga.count % 100 != 0
                }
                
                if self.mangaList.isEmpty {
                    self.mangaList = manga
                } else {
                    self.mangaList.append(contentsOf: manga)
                }
            })
            .store(in: &cancellables)

        $selectionGenreManga
            .debounce(for: .seconds(0.7), scheduler: DispatchQueue.main)
            .sink(receiveValue: {
                [weak self] genre in
                guard let self = self else { return }
                self.mangaList = []
                self.pageMangaList = 1
                self.isLastPage = false
                self.mangaGenreService.getManga(genre: genre, page: self.pageMangaList)
            })
            .store(in: &cancellables)
    }
    
    public func fetchNextPage() {
        guard isLoading, isLastPage == false else { return }
        pageMangaList += 1
        self.mangaGenreService.getManga(genre: selectionGenreManga, page: pageMangaList)
    }
}
