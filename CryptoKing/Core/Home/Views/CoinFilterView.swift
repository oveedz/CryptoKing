//
//  CoinFilterView.swift
//  CryptoKing
//
//  Created by Ovidio  on 10/21/22.
//

import SwiftUI

struct CoinFilterView: View {
    @EnvironmentObject var vm: HomeViewModel
    var body: some View {
//      background v stack
        VStack {
//          content v stack
            VStack(spacing: 20) {
                HStack {
                    Spacer()
                    Text("Filters")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.white)
                    Spacer()
                    
                    XmarkView()

                }
                
                VStack(spacing: 10) {
                    HStack {
                        Text("By Price")
                            .foregroundColor(.white)
                            .font(.title2)
                            .bold()
                            .padding()
                        Spacer()
                    }
                    
                    CoinFilterManager.instance.createFilterBox(title: "Lowest to Highest",
                                                               isChecked: $vm.lowestToHighestIsChecked)
                        .disabled(vm.highestToLowestIsChecked)
                    CoinFilterManager.instance.createFilterBox(title: "Highest to Lowest",
                                                               isChecked: $vm.highestToLowestIsChecked)
                        .disabled(vm.lowestToHighestIsChecked)
                }
                
                Spacer()
            }
            .padding(.vertical,50)
            .padding(.horizontal)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.theme.background).ignoresSafeArea()
    }
}


struct CoinFilterView_Previews: PreviewProvider {
    static var previews: some View {
        CoinFilterView()
            .environmentObject(dev.homeVM)
    }
}
