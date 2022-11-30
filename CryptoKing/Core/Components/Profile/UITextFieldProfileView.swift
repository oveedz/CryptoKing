//
//  UITextFieldProfileView.swift
//  CryptoKing
//
//  Created by Ovidio  on 11/30/22.
//

import SwiftUI

struct UITextFieldProfileView: View {
    @Binding var textFieldText: String
    let keyboardType: UIKeyboardType
    var placeholderText: String = "Search"
    var isSecure: Bool = false
    var body: some View {
        UITextFieldViewRepresentable(textFieldText: $textFieldText,
                                     placeholder: placeholderText,
                                     isSecureField: isSecure)
            .frame(maxWidth: .infinity)
            .frame(height: 20)
            .padding()
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(lineWidth: 0.5)
                    .fill(Color.theme.accent)
            }
    }
}

struct UITextFieldProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UITextFieldProfileView(textFieldText: .constant(""), keyboardType: .emailAddress)
    }
}
