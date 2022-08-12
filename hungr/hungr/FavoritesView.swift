//
//  FavoritesView.swift
//  hungr
//
//  Created by WillC on 8/10/22.
//

import SwiftUI

struct FavoritesView: View {
//    let favVM = FavoritesVM()
    @State var favoriteMeals: [(String, Bool)] = [("test", true), ("fav", true), ("meals", true)]
    
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            VStack {
                Text("Favorites").font(.largeTitle)
                    .foregroundColor(.textColor)
                ForEach(favoriteMeals.indices, id: \.self) { index in
                    VStack {
                        Text(favoriteMeals[index].0)
                            .foregroundColor(.textColor)
                            .font(.title2)
                        HStack {
                            Image(systemName: "logo.playstation")
                            Button(action: { favoriteMeals[index].1.toggle() }) {
                                if favoriteMeals[index].1 {
                                    Image(systemName: "star.fill")
                                } else {
                                    Image(systemName: "star")
                                }
                            }
                        }
                        .foregroundColor(.accent2)
                        .font(.system(size: 125))
                    }
                }
                .plainList()
            }
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
