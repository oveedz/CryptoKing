//
//  PreviewProvider.swift
//  CryptoKing
//
//  Created by Ovidio  on 9/7/22.
//

import Foundation
import SwiftUI


//This extension gives us access to the PreviewProvider.dev (which returns the DeveloperPreview instance)
extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
}

//  This entire class gives us access to many different things we might need for out previews.
class DeveloperPreview {
//  Since we're initializing our instance within the class, we can apply the private keyword. This is done in order to prevent
//  the creation of another instance of our DeveloperPreview class (we only want one instance). This ensures that we can only initialize
//  DeveloperPreview within our class.
    static let instance = DeveloperPreview()
    
    private init() {}
    
    let coin = Coin(id: "bitcoin", symbol: "BTC", name: "Bitcoin", image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579", currentPrice: 20657, marketCap: 393583827788, marketCapRank: 1, fullyDilutedValuation: 433420473548, totalVolume: 26686144923, high24H: 21439, low24H: 20283, priceChange24H: -415.2779030005513, priceChangePercentage24H: 1.97073, marketCapChange24H: -8350678039.550293, marketCapChangePercentage24H: -2.07762, circulatingSupply: 19069843, totalSupply: 21000000, maxSupply: 21000000, ath: 69045, athChangePercentage: -70.13634, athDate: "2021-11-10T14:24:11.849Z", atl: 67.81, atlChangePercentage: 30307.9048, atlDate: "2013-07-06T00:00:00.000Z", lastUpdated: "2022-06-17T16:03:37.342Z", sparklineIn7D: SparklineIn7D(price: [30023.87706688285, 29680.57115410158]), priceChangePercentage24HInCurrency: 3952.64, currentHoldings: 1.5)
    
    let homeVM = HomeViewModel()
    
    let stat1 = Statistic(title: "Market cap", value: "$12.00Bn", percentageChange: 25.32)
    let stat2 = Statistic(title: "Total Volume", value: "$1.23Tr")
    let stat3 = Statistic(title: "Portfolio value", value: "$12.00Bn", percentageChange: -25.32)

    

}



