//
//  UIApplication.swift
//  CryptoKing
//
//  Created by Ovidio  on 10/14/22.
//

import Foundation
import SwiftUI


// Dismisses keyboard when x button pressed
extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
