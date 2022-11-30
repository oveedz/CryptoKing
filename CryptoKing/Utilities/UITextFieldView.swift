//
//  UITextFieldView.swift
//  CryptoKing
//
//  Created by Ovidio  on 11/30/22.
//

import SwiftUI

struct UITextFieldView: View {
    let keyboardType: UIKeyboardType
    @State var text: String = ""
    var body: some View {
        UITextFieldViewRepresentable(textFieldText: $text, placeholder: "Search")
            .padding()
            .frame(height: 55)
            .background(Color.gray)
            .cornerRadius(10)
    }
}

struct UITextFieldViewRepresentable: UIViewRepresentable {
    @Binding var textFieldText: String
    let placeholder: String
    let placeholderColor: UIColor
    let foregroundColor: Color
    let isSecureField: Bool
    
    init(textFieldText: Binding<String>,
         placeholder: String, placeholderColor: UIColor = .white,
         isSecureField: Bool = false, foregroundColor: Color = .white) {
        self._textFieldText = textFieldText
        self.placeholder = placeholder
        self.placeholderColor = placeholderColor
        self.isSecureField = isSecureField
        self.foregroundColor = foregroundColor
    }

    
//      Allows us to send data FROM UIKit to SwiftUI
    func makeCoordinator() -> Coordinator {
        return Coordinator(textFieldText: $textFieldText)
    }
    
//  This class is being created within the struct because it will never bes used anywhere else
    class Coordinator: NSObject, UITextFieldDelegate {
        @Binding var textFieldText: String
        init(textFieldText: Binding<String>) {
//          The underscore refers to the binding parameter in the init
            self._textFieldText = textFieldText
        }
        func textFieldDidChangeSelection(_ textField: UITextField) {
            textFieldText = textField.text ?? ""
        }
    }
    
    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField(frame: .zero)
        let placeholder = NSAttributedString(string: placeholder, attributes: [
            .foregroundColor : placeholderColor
        ])
        textField.attributedPlaceholder = placeholder
        textField.isSecureTextEntry = isSecureField
        textField.textColor = UIColor(foregroundColor)
        textField.delegate = context.coordinator
        return textField
    }
    
//  Allows us to send data FROM SwiftUI to UIKit
//  The uiView parameter matches the return type from the makeUIView function above
//  The context also matches the same context from the above function
    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = textFieldText
    }
}

struct UITextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        UITextFieldView(keyboardType: .emailAddress)
    }
}
