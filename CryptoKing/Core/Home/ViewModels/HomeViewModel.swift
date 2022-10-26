//
//  HomeViewModel.swift
//  CryptoKing
//
//  Created by Ovidio  on 9/7/22.
//

import Foundation
import Combine
import Firebase
import UIKit

/*
 Entire Explanation for how data is traveling through the app
 
 -  Our View has a reference to the HomeViewModel
 -  The ViewModel has a reference to the CoinDataService, which is being initialized in the ViewModel.
 -  Since the CoinDataService is being initialized, the very first thing that happens is the getCoins function
 -  This is because it is the first thing that is placed in the init() of our CoinDataService
 -  The getCoins function will go to the defined url, download the data, check that the data is valid,
    decode the data, and finally take the data and append it to the allCoins array within the CoinDataService.
 -  When any change occurs to the allCoins array in our CoinDataService (such as appending), it will publish this
    change to any potential subscribers.
 -  As we circle back to our HomeVM, we have a function called addSubscribers() which subscribes to the CoinDataService
    allCoins array will be used to append that data to our allCoins array in the HomeVM
 */

class HomeViewModel: ObservableObject {
//  We need to populate this allCoins variable with the allCoins variable in out Data Service. The way this works is because
//  The allCoins in our VM is subscribing to the allCoins variable in the data service.
    @Published var allCoins: [Coin] = []
    @Published var portfolioCoins: [Coin] = []
    @Published var textFieldText = ""
    
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var profileImage: UIImage? = nil

//  Bool used to show sheet
    @Published var showLoginPage: Bool = false
    
    @Published var isLoggedIn: Bool = false


    
    @Published var lowestToHighestIsChecked: Bool = false
    @Published var highestToLowestIsChecked: Bool = false
    

    private let service = CoinDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        
//        We were using this before the searchText Publisher and because we're constantly filtering and updating
//        our allCoins list we actually don't need to subscribe to it here when it's already done below

//        service.$allCoins
//            .sink { [weak self] returnedCoins in
//                self?.allCoins = returnedCoins
//            }
//            .store(in: &cancellables)

//      We want to filter our search text to the coin list. We need a reference to the coin list
//      and we can do that by using combineLatest to the allCoins publisher above ^
//      This search text is now subscribing to two different publishers, so when either values change
//      it will get published
//      Now when we use sink, it will return two values. The first value will be the original publisher (textFieldText)
//      and the next one is the combineLatest(service.$allCoins)
        
//      We use map to transform the output of both publishers into some type of data
//      The inputs refer to the both publishers and the return type is the data we expect after the transformation
//      We want an array of Coins when the user is actively searching for coins
        $textFieldText
            .combineLatest(service.$allCoins)
//          Whenever using a text field, it's important to use debounce as users tend to type really fast.
//          Debounce adds a slight delay until the user stops typing for 0.5 seconds and will publish the values
//          (otherwise it would publish instantly)
//          We also place it before anny mapping or subscribing because we don't want to do any of that until the user stops typing
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
//           Since the inputs are the exact same we don't need to specify them when calling the map function
            .map(filteredSearchCoins)
            .sink { [weak self] returnedCoins in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
        
        $highestToLowestIsChecked
            .combineLatest(service.$allCoins)
            .map(filteredCoinsLowestToHighest)
            .sink {[weak self] returnedCoins in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
        
        $lowestToHighestIsChecked
            .combineLatest(service.$allCoins)
            .map(filteredCoinsHighestToLowest)
            .sink {[weak self] returnedCoins in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
    }
    
    private func filteredSearchCoins(text: String, startingCoins: [Coin]) -> [Coin] {
//              If the text is empty we don't need to do any filtering
                guard !text.isEmpty else {
                    return startingCoins
                }
                
//              First we convert our published text to lowercase because filtering in Swift is case sensitive
                let lowercaseText = text.lowercased()
                
                let filteredCoins = startingCoins.filter { coin in
                    return coin.name.lowercased().contains(lowercaseText) ||
                    coin.symbol.lowercased().contains(lowercaseText) ||
                    coin.id.lowercased().contains(lowercaseText)
                }
                
                return filteredCoins
    }
    
    
    private func filteredCoinsLowestToHighest(isFilter: Bool, startingCoins: [Coin]) -> [Coin] {
        guard isFilter == true else {
            return startingCoins
        }

        let filteredCoins = startingCoins.sorted(by: {$0.currentPrice > $1.currentPrice})
        return filteredCoins
    }
    
    private func filteredCoinsHighestToLowest(isFilter: Bool, startingCoins: [Coin]) -> [Coin] {
        guard isFilter == true else {
            return startingCoins
        }

        let filteredCoins = startingCoins.sorted(by: {$0.currentPrice < $1.currentPrice})
        return filteredCoins
    }
    
    func signInWithEmail() {
        FirebaseViewModel.instance.auth.signIn(withEmail: email, password: password) { res, error in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    func signUpWithEmail() {
        FirebaseViewModel.instance.auth.createUser(withEmail: email, password: password) { res, error in
            if let error = error {
                print(error.localizedDescription)
            }
            print("Success sign up")

        }
    }

}
