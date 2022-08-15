//
//  FavoritesView.swift
//  hungr
//
//  Created by WillC on 8/10/22.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var favVM: SearchVM
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.background.ignoresSafeArea()
                VStack {
                    HStack {
                        Spacer()
                        EditButton().padding()
                    }
                    Text("Favorites")
                        .font(.largeTitle)
                        .foregroundColor(.textColor)
                    ForEach(favVM.favorites, id: \.self.id) { favorite in
                        NavigationLink(destination: MealDetailsView(viewModel: favorite)) {
                            VStack {
                                Text(favorite.name)
                                    .bold()
                                    .frame(height: 80)
                                    .foregroundColor(.textColor)
                                    .multilineTextAlignment(.center)
                                    .font(.title2)
                                HStack {
                                    Image(data: favorite.imageData)
                                        .resizable()
                                        .frame(width: 150, height: 150)
                                    Image(systemName: "star.fill")
                                }
                                .foregroundColor(.accent2)
                                .font(.system(size: 125))
                            }
                        }
                    }
                    .onDelete { offset in
                        favVM.delete(at: offset)
                    }
                    .plainList()
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
            
        }
    }
}

//struct FavoritesView_Previews: PreviewProvider {
//    static var previews: some View {
//        FavoritesView()
//    }
//}
