//
//  CryptoKingApp.swift
//  CryptoKing
//
//  Created by Ovidio  on 6/15/22.
//

import SwiftUI
import Firebase

@main
struct CryptoKingApp: App {
//    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
//  We create the environment instance of our ViewModel here because we plan on using it in many different Views across our app.
//  By declaring an environment object on our NavigationView, ALL of the children views of the Nav View will have access to the ViewModel.
    @StateObject private var vm = HomeViewModel()

    var body: some Scene {
        WindowGroup {
//          Since we are customizing our header, we don't want the basic navigation title. Instead, we embed our first view
//          in a navigation view and hide the bar.
            CryptoKingSplashView()
                .environmentObject(vm)
        }
    }
}
