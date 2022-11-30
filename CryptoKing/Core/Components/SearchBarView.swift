//
//  SearchBarView.swift
//  CryptoKing
//
//  Created by Ovidio  on 10/10/22.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var textFieldText: String
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(
                    textFieldText.isEmpty ? Color.theme.secondaryText : Color.theme.accent
                )
                .padding()
            UITextFieldViewRepresentable(textFieldText: $textFieldText,
                                         placeholder: "Search by name or symbol",
                                         foregroundColor: Color.theme.accent)
                .offset(x: -15, y: -1)
                .disableAutocorrection(true)
            
            if !textFieldText.isEmpty {
                Image(systemName: "xmark.circle.fill")
                    .foregroundColor(Color.red)
                    .font(.headline)
                    .padding(15)
                    .onTapGesture {
                        UIApplication.shared.endEditing()
                        textFieldText = ""
                    }
            }
                
        }
        .font(.headline)
        .frame(maxWidth: .infinity)
        .frame(height: 50)
        .background(Color.theme.background)
        .cornerRadius(40)
        .shadow(color: Color.theme.accent, radius: 2, x: 0, y: 0)
        .padding()

    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(textFieldText: .constant(""))
            .preferredColorScheme(.dark)
    }
}
