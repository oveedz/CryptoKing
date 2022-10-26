//
//  CoinRowView.swift
//  CryptoKing
//
//  Created by Ovidio  on 6/20/22.
//

import SwiftUI

struct CoinRowView: View {
    var coin: Coin
    let showHoldingsColumn: Bool
    
    var body: some View {
        HStack {
            HStack {
                symbol
                
                Spacer()
                
                prices
            }
            .font(.subheadline)

        }
        .frame(maxWidth: .infinity)
        .frame(height: 80)
        .background(Color(.init(gray: 0.5, alpha: 0.2)))
        .cornerRadius(10)
    }
}

extension CoinRowView {
    
    private var symbol: some View {
        HStack(spacing: 10) {
            
            CoinImageView(coin: coin)
                .frame(width: 30, height: 30)

            
            VStack(alignment: .leading) {
                Text(coin.symbol.uppercased())
                    .font(.subheadline)
                    .bold()
                    .foregroundColor(Color.theme.accent)
                
                Text(coin.name)
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.white)
                    .lineLimit(2)

            }
            
        }
        .padding(.leading)
        .frame(width: UIScreen.main.bounds.width * 0.4, alignment: .leading)
    }
    
//    private var showHoldings: some View {
//        VStack(alignment: .trailing) {
//            Text(coin.currentHoldingsValue.asCurrencyWith2Decimals())
//                .fontWeight(.semibold)
//                .font(.subheadline)
//
//            Text((coin.currentHoldings ?? 0).asNumberString())
//        }
//        .foregroundColor(Color.theme.accent)
//        .frame(width: UIScreen.main.bounds.width * 0.3, alignment: .trailing)
//
//    }

    
    
    private var prices: some View {
        VStack(alignment: .trailing) {
            Text(coin.currentPrice.asCurrencyWith6Decimals())
                .foregroundColor(.white)
                .fontWeight(.semibold)
                .font(.subheadline)
            
             
            if let priceChange = coin.priceChangePercentage24H {
                HStack(spacing: 0) {
                    Text(priceChange.asPercentString())
                        .foregroundColor(priceChange >= 0 ? .green : .red)
                        .bold()
                    
                    Image(systemName: priceChange >= 0 ? "arrow.up": "arrow.down")
                        .foregroundColor(priceChange >= 0 ? .green : .red)
                        .font(.caption2)
                }
            }
            
        }
        .padding(.trailing)
        .frame(width: UIScreen.main.bounds.width * 0.4, alignment: .trailing)
    }
}


struct CoinRowView_Previews: PreviewProvider {
    static var previews: some View {
        CoinRowView(coin: dev.coin, showHoldingsColumn: true)
            .preferredColorScheme(.dark)
    }
}
