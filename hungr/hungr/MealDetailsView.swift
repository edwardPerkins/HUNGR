//
//  MealDetailsView.swift
//  hungr
//
//  Created by Kevin McKenney on 8/9/22.
//

import SwiftUI

struct MealDetailsView: View {
    let viewModel: MealVM
    
    var body: some View {
        VStack {
            Text(viewModel.name).font(.largeTitle)
            Image(data: viewModel.imageData).resizable().frame(width: 150, height: 150)
            ScrollView {
                Text(viewModel.instructions)
                    .padding(.horizontal, 10)
                    .font(.body)
            }
            ForEach(viewModel.ingredients, id: \.self) { ingredient in
                HStack {
                    Text(ingredient.amount)
                    Spacer()
                    Text(ingredient.name)
                        .foregroundColor(.accent2)
                }
            }
            .plainList()
        }
        .foregroundColor(Color.textColor)
        .background { Color.background.ignoresSafeArea() }
    }
}


//
//struct MealDetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        MealDetailsView(vm: .init(.init(id: "af", name: "af", instructions: "af", imageURL: "af", ingredients: [.init(name: "as", amount: "asf")])))
//    }
//}
