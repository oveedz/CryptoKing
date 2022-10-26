//
//  CoinImageService.swift
//  CryptoKing
//
//  Created by Ovidio  on 10/9/22.
//

import Foundation
import UIKit
import Combine

class CoinImageService {
    @Published var image: UIImage? = nil
    private var imageSubscription: AnyCancellable?
    private let coin: Coin
    private let fileManager = LocalFileManager.instance
//  We can hard code this because this folder is specific to the CoinImageService
    private let folderName = "coin_images"
    
    private let imageName: String
    
    init(coin: Coin) {
        self.coin = coin
        
//      We initialize the imageName here so there is no mix up if we input the coin id multiple times below
        self.imageName = coin.id
        
        getCoinImage()
    }
    
    private func getCoinImage() {
//      We save the images based on the id that the coin has
        if let savedImage = fileManager.getImage(imageName: coin.id, folderName: folderName) {
            image = savedImage
            print("Retrieved image from file manager")
        } else {
            downloadCoinImage()
            print("downloading image now")

        }
    }
    
    private func downloadCoinImage() {
        guard let url = URL(string: coin.image) else {return}
        
       imageSubscription =
        NetworkingManager.download(url: url)
//        We did not include the .decode() in the NetworkingManager refactoring because it is specific to the getCoins func
//        This is because the .decode() returns [Coin]. Another url may retrun something else.
            .tryMap({ data -> UIImage? in
                return UIImage(data: data)
            })
            .sink { completion in
                NetworkingManager.handleCompletion(completion: completion)
            } receiveValue: { [weak self] returnedImage in
                guard let self = self, let downloadedImage = returnedImage else { return }
                self.image = downloadedImage
                self.imageSubscription?.cancel()
                self.fileManager.saveImage(image: downloadedImage, imageName: self.imageName, folderName: self.folderName)
            }
    }
    
}
