//
//  HomeView.swift
//  OTUSHW2
//
//  Created by Дмитрий Мальцев on 16.12.2021.
//

import SwiftUI

enum Tab: String {
    case anime
    case manga
}

struct HomeView: View {
    @ObservedObject private var animeListViewModel: AnimeListViewModel = .init()
    @ObservedObject private var mangaListViewModel: MangaListViewModel = .init()
    @State private var selectionTab: Tab = .anime
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        TabView(selection: $selectionTab) {
            NavigationStackView {
                AnimeListView()
                    .environmentObject(animeListViewModel)
            }
            .tag(Tab.anime)
            NavigationView {
                MangaListView()
                    .navigationBarHidden(true)
                    .environmentObject(mangaListViewModel)
            }
            .tag(Tab.manga)
        }
        .overlay(
            TabBarView(selection: $selectionTab)
            , alignment: .bottom
        )
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
