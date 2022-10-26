//
//  PrimaryButton.swift
//  CryptoKing
//
//  Created by Ovidio  on 10/19/22.
//

import SwiftUI

struct PrimaryButtonView: View {
    let buttonTitle: String
    var body: some View {
        Text(buttonTitle)
            .font(.headline)
            .foregroundColor(Color.white)
            .frame(maxWidth: .infinity)
            .frame(height: 55)
            .background(
                LinearGradient(gradient: Gradient(
                    colors: [Color.theme.accent, Color(uiColor: .systemMint).opacity(0.8)]),
                    startPoint: .bottomLeading, endPoint:  .topTrailing)
            )
            .cornerRadius(10)
    }
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButtonView(buttonTitle: "Login")
    }
}
