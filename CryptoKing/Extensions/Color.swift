//
//  Color.swift
//  CryptoKing
//
//  Created by Ovidio  on 6/16/22.
//

import Foundation
import SwiftUI

extension Color {
//  Defining as static so we can use this variable among all instances.
    static let theme = ColorTheme()
}

// Collection of all the colors available in the app. Each stored in their own variable.
struct ColorTheme {
    let accent = Color("AccentColor")
    let background = Color("BackgroundColor")
    let secondaryText = Color("SecondaryTextColor")
    let green = Color("GreenColor")
    let red = Color("RedColor")
}




