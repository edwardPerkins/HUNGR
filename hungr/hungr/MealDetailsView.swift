//
//  MealDetailsView.swift
//  hungr
//
//  Created by Kevin McKenney on 8/9/22.
//

import SwiftUI

struct MealDetailsView: View {
    let vm: MealDetailsVM
    
    var body: some View {
        VStack {
            Text(vm.name).font(.largeTitle)
            Image(uiImage: UIImage(data: vm.imageData) ?? UIImage()).resizable().frame(width: 150, height: 150)
            ScrollView {
            Text(vm.instructions)
                .padding(.horizontal, 10)
                .font(.body)
            }
            ingredientList
        }
        .foregroundColor(Color.textColor2)
        .background { Color.background.ignoresSafeArea() }
    }
    
    private var ingredientList: some View {
        List {
            ForEach(vm.ingredients, id: \.self) { ingredient in
                HStack {
                    Text(ingredient.amount)
                    Spacer()
                    Text(ingredient.name)
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
                .foregroundColor(Color.background2)
        }
    }
}

//
//struct MealDetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        MealDetailsView(vm: .init(.init(id: "af", name: "af", instructions: "af", imageURL: "af", ingredients: [.init(name: "as", amount: "asf")])))
//    }
//}
