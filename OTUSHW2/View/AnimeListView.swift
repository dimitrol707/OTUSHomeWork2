//
//  AnimeListView.swift
//  OTUSHW2
//
//  Created by Дмитрий Мальцев on 17.12.2021.
//

import SwiftUI

struct AnimeListView: View {
    @EnvironmentObject private var homeViewModel: HomeViewModel
    @EnvironmentObject private var navStackViewModel: NavigationStackViewModel
    @EnvironmentObject private var animeListViewModel: AnimeListViewModel
    @Namespace var animProductTab
    @GestureState var isDrag: Bool = false
    @State var offsetDrag: CGFloat = 0
    @State var selectDragRow: Anime? = nil
    
    var body: some View {
        
        VStack {
            genreAnimeList
            if animeListViewModel.animeList.isEmpty {
                VStack {
                    Spacer()
                    ProgressView()
                    Spacer()
                }
            } else {
                animeList
            }
        }
        .background(
            Color(UIColor.systemGray6)
        )
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct AnimeListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStackView {
            AnimeListView()
                .environmentObject(AnimeListViewModel())
                .environmentObject(HomeViewModel())
        }
    }
}

extension AnimeListView {
    var genreAnimeList: some View {
        ScrollViewReader {
            proxy in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    ForEach(GenreAnime.allCases.sorted(), id: \.self) {
                        genre in
                        VStack {
                            Text(genre.toString())
                                .font(.title2)
                                .fontWeight(.semibold)
                                .foregroundColor(animeListViewModel.selectionGenreAnime == genre ? .black : Color(UIColor.systemGray3))
                                .padding(.bottom, 10)
                                .overlay(
                                    Group {
                                        if animeListViewModel.selectionGenreAnime == genre {
                                            Capsule()
                                                .fill(Color.blue)
                                                .matchedGeometryEffect(id: "GENRETAB", in: animProductTab)
                                                .frame(height: 3)
                                        } else {
                                            Capsule()
                                                .fill(Color.clear)
                                                .frame(height: 3)
                                        }
                                    }
                                    , alignment: .bottom
                                )
                        }
                        .onTapGesture {
                            withAnimation(.easeInOut) {
                                animeListViewModel.selectionGenreAnime = genre
                                proxy.scrollTo(genre, anchor: .center)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .padding(.bottom, 10)
        }
        
    }
    var animeList: some View {
        GeometryReader {
            proxy in
            ScrollView(.vertical, showsIndicators: true) {
                VStack(spacing: 10) {
                    ForEach(animeListViewModel.animeList) {
                        anime in
                        ProductRowView(product: anime)
                            .onTapGesture {
                                navStackViewModel.push(ProductItemView(product: anime))
                            }
                            .offset(x: selectDragRow?.id == anime.id ? offsetDrag : 0)
                            .gesture(
                                DragGesture()
                                    .updating($isDrag, body: { value, out, _ in
                                        DispatchQueue.main.async {
                                            if selectDragRow == nil {
                                                selectDragRow = anime
                                            }
                                        }
                                        out = true
                                    })
                                    .onChanged({ value in
                                        let translation = value.translation.width
                                        offsetDrag = (isDrag ? translation : .zero)
                                    })
                                    .onEnded({ value in
                                        withAnimation {
                                            offsetDrag = .zero
                                            selectDragRow = nil
                                        }
                                    })
                            )
                    }
                    Group {
                        if animeListViewModel.isLoading, animeListViewModel.isLastPage == false {
                            ProgressView()
                                .onAppear(perform: {
                                    animeListViewModel.fetchNextPage()
                                })
                        } else {
                            GeometryReader{
                                reader -> Color in
                                let minY = reader.frame(in: .global).minY
                                let height = UIScreen.main.bounds.height / 1.2
                                if !animeListViewModel.animeList.isEmpty  && minY < height {
                                    DispatchQueue.main.async {
                                        animeListViewModel.isLoading = true
                                    }
                                }
                                
                                return Color.clear
                            }
                            .frame(width: 20, height: 20)
                        }
                    }
                }
                .padding(.horizontal, 10)
            }
            .padding(.bottom, 60)
            .frame(width: proxy.size.width, height: proxy.size.height)
            
        }
    }
}
