//
//  PlainList.swift
//  hungr
//
//  Created by Kevin McKenney on 8/11/22.
//

import SwiftUI

struct PlainList: ViewModifier {
    func body(content: Content) -> some View {
        List {
            content.listRowBackground(Color.accent1)
        }
        .listStyle(.plain)
        .safeAreaInset(edge: .bottom) {
            Rectangle()
                .ignoresSafeArea()
                .frame(height: 1)
                .foregroundColor(.background)
        }
    }
}

extension View {
    func plainList() -> some View {
        modifier(PlainList())
    }
}
