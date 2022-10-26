//
//  XmarkView.swift
//  CryptoKing
//
//  Created by Ovidio  on 10/21/22.
//

import SwiftUI

struct XmarkView: View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        Button {
            dismiss()
        } label: {
            Image(systemName: "xmark")
                .font(.system(size: 10, weight: .semibold, design: .rounded))
                .foregroundColor(.white)
                .padding(5)
                .overlay {
                    Circle()
                        .stroke(lineWidth: 1)
                        .fill(Color.white)
                }
        }
    }
}

struct XmarkView_Previews: PreviewProvider {
    static var previews: some View {
        XmarkView()
    }
}
