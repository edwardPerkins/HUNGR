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
            Color(UIColor.Background ?? .orange)
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
            .foregroundColor(Color(uiColor: UIColor.AccentOne ?? .systemMint))
            .padding(.vertical, 10)
            .padding(.horizontal, 35)
            .background(Color(uiColor: UIColor.AccentTwo ?? .yellow))
    }
    
    var thankYouSection: some View {
        Text(FirstTimeUse.thankYouMessage.rawValue)
            .font(.system(size: 33.0))
            .foregroundColor(Color(uiColor: UIColor.TextColor ?? .darkGray))
            .padding()
            .multilineTextAlignment(.center)
    }
    
    var logoSection: some View {
        Image(systemName: "fork.knife.circle.fill")
            .resizable()
            .frame(width: 275, height: 275)
            .foregroundColor(Color(uiColor: UIColor.AccentTwo ?? .yellow))
            .padding(.bottom, 55)
    }
    
    var continueSection: some View {
        Button(action: {},
               label: {
                Text("Continue")
                    .font(.system(size: 40.0))
                    .foregroundColor(Color(uiColor: UIColor.AccentOne ?? .systemMint))
                }
        )
        .frame(width: UIScreen.main.bounds.width - 40, alignment: .center)
        .padding(.vertical)
        .background(Color(uiColor: UIColor.AccentTwo ?? .yellow))
        .cornerRadius(8)
    }
    
}

struct FirstTimeUseView_Previews: PreviewProvider {
    static var previews: some View {
        FirstTimeUseView()
    }
}
