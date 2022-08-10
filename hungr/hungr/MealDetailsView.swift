//
//  MealDetailsView.swift
//  hungr
//
//  Created by Kevin McKenney on 8/9/22.
//

import SwiftUI

struct MealDetailsView: View {
    let vm = MealDetailsVM()
    
    var body: some View {
        VStack {
            Text(vm.name).font(.largeTitle)
            Rectangle().frame(width: 150, height: 150)
            ScrollView {
            Text(vm.instructions)
                .padding(.horizontal, 10)
                .font(.body)
            }
            ingrediantList
        }
        .foregroundColor(.textColor)
        .background { Color.background.ignoresSafeArea() }
    }
    
    var ingrediantList: some View {
        List {
            ForEach(vm.ingrediants, id: \.self) { ingrediant in
                HStack {
                    Text(ingrediant.amount)
                    Spacer()
                    Text(ingrediant.name)
                        .foregroundColor(.accent2)
                }
            }
            .listRowBackground(Color.accent1)
        }
        .listStyle(.plain)
        .frame(height: CGFloat(vm.listheight))
        .safeAreaInset(edge: .bottom) {
            Rectangle()
                .ignoresSafeArea()
                .frame(height: 1)
                .foregroundColor(.background)
        }
    }
}

struct MealDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MealDetailsView()
    }
}
