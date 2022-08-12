//
//  FirstTimeUseView.swift
//  hungr
//
//  Created by Spencer Hurd on 8/9/22.
//

import SwiftUI

struct FirstTimeUseView: View {
    var firstUse: Bool { !UserDefaults.standard.bool(forKey: "usedAlready") }
    
    var body: some View {
        NavigationView {
            if firstUse {
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
            } else {
                TabViewRepresentable().navigationBarHidden(true).ignoresSafeArea()
            }
        }
        .accentColor(.accent2)
    }
}

extension FirstTimeUseView {
    
    var welcomeSection: some View {
        Text("WELCOME!!!!!!")
            .font(.system(size: 45.0))
            .foregroundColor(.accent1)
            .padding(.vertical, 10)
            .padding(.horizontal, 25)
            .background(Color.accent2)
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
            .foregroundColor(.accent2)
            .padding(.bottom, 55)
    }
    
    var continueSection: some View {
        NavigationLink(destination: TabViewRepresentable().navigationBarHidden(true).ignoresSafeArea()) {
            Text("Continue")
                .font(.system(size: 40.0))
                .foregroundColor(.accent1)
        }
        .frame(width: UIScreen.main.bounds.width - 40, alignment: .center)
        .padding(.vertical, 7)
        .background(Color.accent2)
        .cornerRadius(8)
    }
    
}

struct FirstTimeUseView_Previews: PreviewProvider {
    static var previews: some View {
        FirstTimeUseView()
            .previewInterfaceOrientation(.portraitUpsideDown)
    }
}
