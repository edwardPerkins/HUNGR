//
//  FavoritesView.swift
//  hungr
//
//  Created by WillC on 8/10/22.
//

import SwiftUI

struct FavoritesView: View {
//    let favVM = FavoritesVM()
    let favoriteMeals: [String] = []
    
    
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            VStack {
                Text("Favorites").font(.largeTitle)
                    .foregroundColor(.textColor)
                List {
                    ForEach(favoriteMeals, id: \.self) { favMeal in
                        VStack {
                            Text(favMeal)
                                .foregroundColor(.textColor)
                                .font(.title2)
                            HStack {
                                Image(systemName: "logo.playstation")
                                Image(systemName: "star.fill")
                                    .foregroundColor(.accent2)
                                    
                            }
                            .font(.system(size: 125))
                        }
                    }
                    .listRowBackground(Color.accent1)
                }
                .listStyle(.plain)
                .safeAreaInset(edge: .bottom) {
                    Rectangle()
                        .ignoresSafeArea()
                        .frame(height: 1)
                        .foregroundColor(Color.background2)
                }
            }
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
