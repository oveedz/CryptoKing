//
//  HomeView.swift
//  CryptoKing
//
//  Created by Ovidio  on 6/16/22.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var vm: HomeViewModel
    @State private var showProfile: Bool = false
    @State private var showFilter: Bool = false
    @State var isScrolling: Bool = false

    var body: some View {
        NavigationView {
            ZStack {
                //          Background layer
                Color.theme.background.ignoresSafeArea()
                
                //          Content Layer
                VStack {
                    homeHeader
                                        
                    SearchBarView(textFieldText: $vm.textFieldText)
                    
                    allCoinList
                    
                    
                    Spacer(minLength: 0)
                }
                .sheet(isPresented: $vm.showLoginPage) {
                    LoginView()
                }
            }
            .sheet(isPresented: $showFilter) {
                CoinFilterView()
            }
            .navigationBarHidden(true)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
//  It's good practice to set up your previews to mimic the actual app. In this case with the navigation view.
    static var previews: some View {
        NavigationView {
            HomeView()
                .navigationBarHidden(true)
        }
        .environmentObject(dev.homeVM)

    }
}

extension HomeView {
    private var homeHeader: some View {
        HStack {
            CircleButtonView(icon: showProfile ? "plus" : "info")
                .rotationEffect(Angle(degrees: showProfile ? 90 : 0))
                

            
            Spacer()
            
            Text(showProfile ? "Hello, \(vm.name)" : "Current Prices")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(Color.theme.accent)
                .animation(.none)
            
            Spacer()
            
            Button {vm.showLoginPage = true} label: {
                CircleButtonView(icon: "person.fill")
                    .animation(.none)
            }
        }.padding(.horizontal)
    }
    
    private var headerSubMenu: some View {
            Image(systemName: "line.horizontal.3.decrease.circle")
                .font(.system(size: 20, weight: .semibold, design: .default))
                .onTapGesture {
                    showFilter.toggle()
                    vm.highestToLowestIsChecked = false
                    vm.lowestToHighestIsChecked = false
                }
                .padding(.horizontal)
                .foregroundColor(.white)
    }
    
    private var allCoinList: some View {
        ScrollViewReader { proxy in
            VStack {
                HStack {
                    Spacer()

                    Text("")
                        .frame(width: 200, height: 24)
                        .background(Color.theme.background)
                        .padding(.trailing, 50)
                        .onTapGesture {
                            withAnimation(.spring()) {
                                proxy.scrollTo("TopItem", anchor: .top)
                            }
                        }
                    
                    headerSubMenu
                }
                
                List {
                    ForEach(vm.allCoins) { coin in
                        CoinRowView(coin: coin, showHoldingsColumn: false)
                            .swipeActions(edge: .trailing, allowsFullSwipe: true, content: {
                                Button {
                                    vm.portfolioCoins.append(coin)
                                } label: {
                                    Image(systemName: "plus")
                                }

                            })
                            .id("TopItem")
                    }
                    .listRowBackground(Color(.init(gray: 0.5, alpha: 0.0)))
                    .listRowSeparator(.hidden)
                }
                .listStyle(PlainListStyle())
                
            }
        }
    }
    
    private var portfolioCoinList: some View {
            List {
                ForEach(vm.portfolioCoins) { coin in
                    CoinRowView(coin: coin, showHoldingsColumn: true)
                }
                .listRowBackground(Color(.init(gray: 0.5, alpha: 0.2)))
                .listRowSeparator(.hidden)
            }
            .listStyle(PlainListStyle())
    }
}
