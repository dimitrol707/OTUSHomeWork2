//
//  ProductRowView.swift
//  OTUSHW2
//
//  Created by Дмитрий Мальцев on 16.12.2021.
//

import SwiftUI

struct ProductRowView: View {
    var product: Product
    
    var body: some View {
        HStack {
            ImageView(imageUrl: product.imageUrl ?? "")
                .scaledToFill()
                .frame(width: 100, height: 120)
                .cornerRadius(10)
            Spacer(minLength: 20)
            VStack(alignment: .trailing, spacing: 0) {
                Text(product.title ?? "Unknown title")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .lineLimit(2)
                    .multilineTextAlignment(.trailing)
                    .foregroundColor(.black)
                typeProduct
                scoreProduct
                Spacer()
            }
        }
        .padding()
        .background(
            Color.white
        )
        .cornerRadius(15)
    }
}

struct ProductRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ProductRowView(product: devPreview.anime)
                .previewLayout(.sizeThatFits)
                .frame(height: 140)
            ProductRowView(product: devPreview.manga)
                .previewLayout(.sizeThatFits)
                .frame(height: 140)
        }
    }
}

extension ProductRowView {
    
    var typeProduct: some View {
        Group {
            if let anime = product as? Anime {
                HStack(spacing: 0) {
                    Text("\(anime.type ?? "unknown type")")
                    Text("(\(anime.episodes != nil ? String(describing: anime.episodes!) : "1..."))")
                }
                .font(.caption)
                .foregroundColor(.black)
            } else if let manga = product as? Manga {
                HStack(spacing: 0) {
                    Text("\(manga.type ?? "unknown type")")
                    Text("(\(manga.volumes != nil ? String(describing: manga.volumes!) : "1..."))")
                }
                .font(.caption)
                .foregroundColor(.black)
            }
        }
    }
    
    var scoreProduct: some View {
        HStack(spacing: 5) {
            Image(systemName: "star.fill")
                .foregroundColor(.yellow)
            Text(product.score != nil ? String(format: "%.2f" , product.score!) : "0.00")
                .foregroundColor(.black)
        }
        .font(.caption)
        .padding(.vertical, 4)
    }
}
