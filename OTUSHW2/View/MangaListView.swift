//
//  MangaListView.swift
//  OTUSHW2
//
//  Created by Дмитрий Мальцев on 17.12.2021.
//

import SwiftUI

struct MangaListView: View {
    @EnvironmentObject var mangaListViewModel: MangaListViewModel
    @Namespace var animProductTab
    @GestureState var isDrag: Bool = false
    @State var offsetDrag: CGFloat = 0
    @State var selectDragRow: Manga? = nil
    
    var body: some View {
        VStack {
            genreMangaList
            if mangaListViewModel.mangaList.isEmpty && !mangaListViewModel.isLastPage {
                VStack {
                    Spacer()
                    ProgressView()
                    Spacer()
                }
            } else if mangaListViewModel.isLastPage {
                VStack {
                    Spacer()
                    Text("Not found")
                    Spacer()
                }
            } else {
                mangaList
            }
        }.background(
            Color(UIColor.systemGray6)
        )
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct MangaListView_Previews: PreviewProvider {
    static var previews: some View {
        MangaListView()
    }
}

extension MangaListView {
    var genreMangaList: some View {
        ScrollViewReader {
            proxy in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    ForEach(GenreManga.allCases.sorted(), id: \.self) {
                        genre in
                        VStack {
                            Text(genre.toString())
                                .font(.title2)
                                .fontWeight(.semibold)
                                .foregroundColor(mangaListViewModel.selectionGenreManga == genre ? .black : Color(UIColor.systemGray3))
                                .padding(.bottom, 10)
                                .overlay(
                                    Group {
                                        if mangaListViewModel.selectionGenreManga == genre {
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
                                mangaListViewModel.selectionGenreManga = genre
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
    
    var mangaList: some View {
        GeometryReader {
            proxy in
            ScrollView(.vertical, showsIndicators: true) {
                VStack(spacing: 10) {
                    ForEach(mangaListViewModel.mangaList) {
                        manga in
                        NavigationLink {
                            LazyView(ProductItemView(product: manga))
                        } label: {
                            ProductRowView(product: manga)
                                .offset(x: selectDragRow?.id == manga.id ? offsetDrag : 0)
                                .gesture(
                                    DragGesture()
                                        .updating($isDrag, body: { value, out, _ in
                                            DispatchQueue.main.async {
                                                if selectDragRow == nil {
                                                    selectDragRow = manga
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
                    }
                    Group {
                        if mangaListViewModel.isLoading, mangaListViewModel.isLastPage == false {
                            ProgressView()
                                .onAppear(perform: {
                                    mangaListViewModel.fetchNextPage()
                                })
                        } else {
                            GeometryReader{
                                reader -> Color in
                                let minY = reader.frame(in: .global).minY
                                let height = UIScreen.main.bounds.height / 1.2
                                if !mangaListViewModel.mangaList.isEmpty  && minY < height {
                                    DispatchQueue.main.async {
                                        mangaListViewModel.isLoading = true
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
