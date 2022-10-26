//
//  CoinFilterManager.swift
//  CryptoKing
//
//  Created by Ovidio  on 10/22/22.
//

import Foundation
import SwiftUI

class CoinFilterManager {
    static let instance = CoinFilterManager()
    
    
    func createFilterBox(title: String, isChecked: Binding<Bool>) -> some View {
        Toggle(title, isOn: isChecked)
            .foregroundColor(.white)
            .toggleStyle(.checklist)
            .animation(.none)
    }
}
