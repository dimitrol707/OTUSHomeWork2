//
//  TabBarView.swift
//  OTUSHW2
//
//  Created by Дмитрий Мальцев on 22.12.2021.
//

import SwiftUI

struct TabBarView: View {
    @Binding var selection: Tab
    
    var body: some View {
        HStack(spacing: 0) {
            Button {
                withAnimation {
                    selection = .anime
                }
            } label: {
                Image(systemName: "film")
                    .font(.title)
                    .foregroundColor(selection == Tab.anime ? .blue : .gray)
                    .padding()
                    .frame(maxWidth: .infinity)
            }
            Button {
                withAnimation {
                    selection = .manga
                }
            } label: {
                Image(systemName: "book")
                    .font(.title)
                    .foregroundColor(selection == Tab.manga ? .blue : .gray)
                    .padding()
                    .frame(maxWidth: .infinity)
            }
        }
        .background(
            Color.white
        )
    }
        
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(selection: .constant(.anime))
            .previewLayout(.sizeThatFits)
    }
}
