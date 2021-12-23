//
//  CharacterItemView.swift
//  OTUSHW2
//
//  Created by Дмитрий Мальцев on 22.12.2021.
//

import SwiftUI

struct CharacterItemView: View {
    @EnvironmentObject private var navStackViewModel: NavigationStackViewModel
    @ObservedObject private var charItemViewModel: CharacterItemViewModel
    
    var product: Product
    
    init(product: Product, idCharacter: Int) {
        self.product = product
        charItemViewModel = .init(idCharacter: idCharacter)
    }
    
    var body: some View {
        ZStack {
            ScrollView(.vertical, showsIndicators: false) {
                ImageView(imageUrl: charItemViewModel.character?.imageUrl ?? "")
                    .scaledToFit()
                    .transformEffect(.init(scaleX: 1.1, y: 1.1))
                    .offset(x: -10, y: -10)
                    .clipShape(Rectangle())
                VStack(alignment: .leading) {
                    Text(charItemViewModel.character?.name ?? "")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(charItemViewModel.character?.about ?? "")
                }
                .padding()
            }
            .padding(.bottom, 60)
            .edgesIgnoringSafeArea([.top, .leading, .trailing])
            Group {
                if product is Anime {
                    VStack {
                        HStack {
                            Button {
                                DispatchQueue.main.async {
                                    navStackViewModel.pop()
                                }
                            } label: {
                                Image(systemName: "arrow.left")
                                    .font(.title2)
                                    .padding()
                                    .background(
                                        Circle()
                                            .foregroundColor(.white)
                                            .shadow(color: .black, radius: 4, x: 1.5, y: 1.5)
                                    )
                            }
                            .padding(10)
                            Spacer()
                        }
                        Spacer()
                    }
                }
            }
        }
        
    }
}

struct CharacterItemView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterItemView(product: devPreview.anime, idCharacter: devPreview.character.id!)
    }
}
