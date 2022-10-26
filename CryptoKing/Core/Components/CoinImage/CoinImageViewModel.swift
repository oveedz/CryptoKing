//
//  CoinImageViewModel.swift
//  CryptoKing
//
//  Created by Ovidio  on 10/9/22.
//

import Foundation
import SwiftUI
import Combine

class CoinImageViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    private let service: CoinImageService
    private let coin: Coin
    private var cancellables = Set<AnyCancellable>()
    
    init(coin: Coin) {
        self.coin = coin
        self.service = CoinImageService(coin: coin)
        self.addSubscribers()
    }
    
    private func addSubscribers() {
        service.$image
            .sink { [weak self] (_) in
                self?.isLoading = false
            } receiveValue: { [weak self] returnedImage in
                self?.image = returnedImage
            }
            .store(in: &cancellables)
    }
}
