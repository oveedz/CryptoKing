//
//  CryptoKingSplashView.swift
//  CryptoKing
//
//  Created by Ovidio  on 10/25/22.
//

import SwiftUI

struct CryptoKingSplashView: View {
    @State private var logoOpacity: CGFloat = 0.5
    @State private var logoSize: CGFloat = 0.6
    @State private var isShowingHomePage: Bool = false

    var body: some View {
        if isShowingHomePage {
            HomeView()
        } else {
            splashScreen
        }
    }
    
    private var splashScreen: some View {
        VStack {
            VStack {
                Image("logo-transparent")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 100, maxHeight: 100)
            }
            .scaleEffect(logoSize)
            .opacity(logoOpacity)
            .onAppear {
                withAnimation(.easeInOut(duration: 1.2)) {
                    self.logoSize = 0.9
                    self.logoOpacity = 1.0
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.theme.background).ignoresSafeArea()
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                withAnimation {
                    self.isShowingHomePage = true
                }
            }
        }

    }
}

struct CryptoKingSplashView_Previews: PreviewProvider {
    static var previews: some View {
        CryptoKingSplashView()
    }
}
