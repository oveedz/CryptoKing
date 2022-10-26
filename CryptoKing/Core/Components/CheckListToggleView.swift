//
//  CheckListToggleView.swift
//  CryptoKing
//
//  Created by Ovidio  on 10/21/22.
//

import SwiftUI

struct CheckListToggleView: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
            HStack {
                configuration.label
                    .font(.headline)
                
                Spacer()
                
                Image(systemName: configuration.isOn ? "checkmark.square.fill":"square")
                    .onTapGesture {
                        configuration.isOn.toggle()
                    }
            }.padding(.horizontal)
    }
}

