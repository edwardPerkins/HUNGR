//
//  SpenceView.swift
//  hungr
//
//  Created by Kevin McKenney on 8/9/22.
//

import SwiftUI

struct SpenceView: View {
    
    
    var body: some View {
        NavigationView {
            NavigationLink(destination: ViewControllerWrapper()) {
                Text("Hello, Spence!")
            }.navigationBarBackButtonHidden(true)
        }.accentColor(.accent2)
    }
    

}

struct SpenceView_Previews: PreviewProvider {
    static var previews: some View {
        SpenceView()
    }
}
