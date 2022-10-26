//
//  CoinDetailView.swift
//  CryptoKing
//
//  Created by Ovidio  on 10/21/22.
//

import SwiftUI

struct CoinDetailView: View {
    @EnvironmentObject var vm: HomeViewModel
    var body: some View {
        Text("Hello, World!")
    }
}

struct CoinDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CoinDetailView()
            .environmentObject(HomeViewModel())
    }
}
