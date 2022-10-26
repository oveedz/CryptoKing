//
//  FirebaseViewModel.swift
//  CryptoKing
//
//  Created by Ovidio  on 10/17/22.
//

import Foundation
import Firebase
import SwiftUI

class FirebaseViewModel: NSObject {
    static let instance = FirebaseViewModel()
    let auth: Auth
    
    override init() {
        FirebaseApp.configure()
        self.auth = Auth.auth()
        super.init()
    }
}
