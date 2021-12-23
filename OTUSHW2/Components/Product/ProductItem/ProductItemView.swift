//
//  ProductItemView.swift
//  OTUSHW2
//
//  Created by Дмитрий Мальцев on 21.12.2021.
//

import SwiftUI

struct ProductItemView: View {
    @EnvironmentObject private var navStackViewModel: NavigationStackViewModel
    @ObservedObject private var prodItemViewModel: ProductItemViewModel
    
    var product: Product
    
    init(product: Product) {
        self.product = product
        prodItemViewModel = .init(product: product)
    }
    
    var body: some View {
        VStack(spacing: 0) {
            Group {
                if product is Anime {
                    HStack {
                        Button {
                            DispatchQueue.main.async {
                                navStackViewModel.pop()
                            }
                        } label: {
                            Image(systemName: "arrow.left")
                                .font(.title2)
                        }
                        .padding(10)
                        Spacer()
                    }
                }
            }
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 10) {
                    Text(product.title ?? "")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    HStack(alignment: .top) {
                        ImageView(imageUrl: product.imageUrl ?? "")
                            .scaledToFit()
                            .frame(width: 170)
                            .cornerRadius(15)
                        Spacer()
                        VStack(alignment: .leading, spacing: 0) {
                            typeProduct
                            episodesProduct
                            authorsProduct
                            Spacer()
                            scoreProduct
                            
                            Text("Members: \(product.members ?? 0)")
                                .font(.caption)
                                .foregroundColor(Color(UIColor.systemGray2))
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                    }
                    .frame(maxWidth: .infinity)
                    genresProduct
                    Text(product.synopsis ?? "")
                    Divider()
                    Text("Characters: ")
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    charactersProduct
                }
                .padding()
            }
            .padding(.bottom, 60)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(product.title ?? "")
    }
    
}

struct ProductItemView_Previews: PreviewProvider {
    static var previews: some View {
        ProductItemView(product: devPreview.anime)
    }
}

extension ProductItemView {
    var typeProduct: some View {
        Group {
            if let anime = product as? Anime {
                HStack {
                    Text("Type:")
                        .font(.callout)
                        .foregroundColor(.gray)
                    Text("\(anime.type ?? "unknown type")")
                        .font(.title3)
                        .foregroundColor(.black)
                }
            } else if let manga = product as? Manga {
                HStack {
                    Text("Type:")
                        .font(.callout)
                        .foregroundColor(.gray)
                    Text("\(manga.type ?? "unknown type")")
                        .font(.title3)
                        .foregroundColor(.black)
                }
            }
        }
    }
    var episodesProduct: some View {
        Group {
            if let anime = product as? Anime {
                HStack {
                    Text("Episodes:")
                        .font(.callout)
                        .foregroundColor(.gray)
                    Text("\(anime.episodes != nil ? String(describing: anime.episodes!) : "1...")")
                        .font(.title3)
                        .foregroundColor(.black)
                }
            } else if let manga = product as? Manga {
                HStack {
                    Text("Volumes:")
                        .font(.callout)
                        .foregroundColor(.gray)
                    Text("\(manga.volumes != nil ? String(describing: manga.volumes!) : "1...")")
                        .font(.title3)
                        .foregroundColor(.black)
                }
            }
        }
    }
    var authorsProduct: some View {
        Group {
            if let anime = product as? Anime {
                VStack(alignment: .leading, spacing: 0) {
                    Text("Producers:")
                        .font(.callout)
                        .foregroundColor(.gray)
                    TagView(tags: anime.producers?.compactMap({ producer in
                        producer.name
                    }) ?? [])
                }
            } else if let manga = product as? Manga {
                VStack(alignment: .leading, spacing: 0) {
                    Text("Authors:")
                        .font(.callout)
                        .foregroundColor(.gray)
                    TagView(tags: manga.authors?.compactMap({ author in
                        author.name
                    }) ?? [])
                }
            }
        }
    }
    var genresProduct: some View {
        TagView(tags: product.genres?.compactMap({ genre in
            genre.name
        }) ?? [])
    }
    var scoreProduct: some View {
        HStack(spacing: 5) {
            Image(systemName: "star.fill")
                .foregroundColor(.yellow)
            Text(product.score != nil ? String(format: "%.2f" , product.score!) : "0.00")
                .foregroundColor(.black)
        }
        .font(Font.system(size: 30))
    }
    var charactersProduct: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 5) {
                ForEach(prodItemViewModel.characterList) {
                    character in
                    Group {
                        if product is Anime {
                            ImageView(imageUrl: character.imageUrl ?? "")
                                .modifier(CharacterImage(character: character))
                                .onTapGesture {
                                    navStackViewModel.push(CharacterItemView(product: product, idCharacter: character.id!))
                                }
                        } else {
                            NavigationLink {
                                LazyView(CharacterItemView(product: product, idCharacter: character.id!))
                            } label: {
                                ImageView(imageUrl: character.imageUrl ?? "")
                                    .modifier(CharacterImage(character: character))
                            }
                        }
                    }
                    
                }
            }
        }
    }
}

private struct CharacterImage: ViewModifier {
    var character: CharacterData
    
    func body(content: Content) -> some View {
        content
            .scaledToFill()
            .frame(width: 120, height: 170)
            .overlay(
                VStack {
                    Text(character.name ?? "")
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal ,5)
                        .foregroundColor(.black)
                }
                .frame(maxWidth: .infinity, minHeight: 60)
                .background(.ultraThinMaterial)
                , alignment: .bottom
            )
            .cornerRadius(5)
    }
}
