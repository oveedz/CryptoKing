//
//  TextFieldView.swift
//  CryptoKing
//
//  Created by Ovidio  on 10/19/22.
//

import SwiftUI

struct TextFieldView: View {
    let keyboardType: UIKeyboardType
    @Binding var text: String
    var textPrompt: Text
    var body: some View {
        TextField("", text: $text, prompt: textPrompt)
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

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView(keyboardType: .emailAddress, text: .constant("Enter text"), textPrompt: Text("Email"))
    }
}
