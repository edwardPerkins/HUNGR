//
//  FirstTimeUseView.swift
//  hungr
//
//  Created by Spencer Hurd on 8/9/22.
//

import SwiftUI

struct FirstTimeUseView: View {
    var body: some View {
        ZStack {
            // background
            Color.background
                .ignoresSafeArea()
            
            // content
            VStack {
                welcomeSection
                thankYouSection
                logoSection
                continueSection
            }
        }
    }
}

extension FirstTimeUseView {
    
    var welcomeSection: some View {
        Text("WELCOME!!!!!!")
            .font(.system(size: 45.0))
            .foregroundColor(.accentOne)
            .padding(.vertical, 10)
            .padding(.horizontal, 25)
            .background(Color.accentTwo)
    }
    
    var thankYouSection: some View {
        Text(FirstTimeUse.thankYouMessage.rawValue)
            .font(.system(size: 33.0))
            .foregroundColor(.textColor)
            .padding()
            .multilineTextAlignment(.center)
    }
    
    var logoSection: some View {
        Image(systemName: "fork.knife.circle.fill")
            .resizable()
            .frame(width: 275, height: 275)
            .foregroundColor(.accentTwo)
            .padding(.bottom, 55)
    }
    
    var continueSection: some View {
        Button(action: {},
               label: {
                Text("Continue")
                    .font(.system(size: 40.0))
                    .foregroundColor(.accentOne)
                }
        )
        .frame(width: UIScreen.main.bounds.width - 40, alignment: .center)
        .padding(.vertical, 7)
        .background(Color.accentTwo)
        .cornerRadius(8)
    }
    
}

extension Color {
    static let background = Color(uiColor: .Background ?? .clear)
    static let textColor = Color(uiColor: .TextColor ?? .clear)
    static let accentOne = Color(uiColor: .AccentOne ?? .clear)
    static let accentTwo = Color(uiColor: .AccentTwo ?? .clear)
}

struct FirstTimeUseView_Previews: PreviewProvider {
    static var previews: some View {
        FirstTimeUseView()
    }
}
