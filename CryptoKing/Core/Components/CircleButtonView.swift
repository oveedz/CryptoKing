//
//  CircleButtonView.swift
//  CryptoKing
//
//  Created by Ovidio  on 6/16/22.
//

import SwiftUI

struct CircleButtonView: View {
    let icon: String
    var body: some View {
        Image(systemName: icon)
            .font(.headline)
            .foregroundColor(Color.theme.accent)
            .frame(width: 40, height: 40)
            .background(
                Circle()
                    .stroke(Color.theme.accent)
            )
            .shadow(color: Color.theme.accent.opacity(0.3),
                    radius: 10, x: 0, y: 0)
            .padding()
    }
}

struct CircleButtonView_Previews: PreviewProvider {
//  Since this is a component and not an entire view, we can use the sizethatfits argument.
    static var previews: some View {
        Group {
            CircleButtonView(icon: "info")
                .previewLayout(.sizeThatFits)
            CircleButtonView(icon: "plus")
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
    }
}
