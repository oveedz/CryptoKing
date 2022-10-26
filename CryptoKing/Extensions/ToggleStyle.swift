//
//  ToggleStyle.swift
//  CryptoKing
//
//  Created by Ovidio  on 10/21/22.
//

import Foundation
import SwiftUI

//Creating a custom toggle checklist
extension ToggleStyle where Self == CheckListToggleView {
    static var checklist: CheckListToggleView { .init() }
}
