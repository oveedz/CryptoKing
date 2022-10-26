//
//  CoinDataService.swift
//  CryptoKing
//
//  Created by Ovidio  on 9/7/22.
//

import Foundation
import Combine

class CoinDataService {
//  We mark this variable as published because our ViewModel will subscribe to this value.
    @Published var allCoins: [Coin] = []
    
    var coinSubscription: AnyCancellable?
    
    init() {
        getCoins()
    }
    
    
//  Private because we're only going to access this function from inside this class.
    private func getCoins() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h") else {
            return
        }
        
       coinSubscription =
        NetworkingManager.download(url: url)
//        We did not include the .decode() in the NetworkingManager refactoring because it is specific to the getCoins func
//        This is because the .decode() returns [Coin]. Another url may retrun something else.
            .decode(type: [Coin].self, decoder: JSONDecoder())
            .sink { completion in
                NetworkingManager.handleCompletion(completion: completion)
            } receiveValue: { [weak self] returnedCoins in
                self?.allCoins = returnedCoins
                self?.coinSubscription?.cancel()
            }
    }
}
