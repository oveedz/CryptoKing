//
//  HomeStatsView.swift
//  CryptoKing
//
//  Created by Ovidio  on 10/26/22.
//

import SwiftUI

struct GlobalMarketView: View {
    
//  Dummy data for UI purposes
    let statistics: [Statistic] = [
    Statistic(title: "Title", value: "Value", percentageChange: 1),
    Statistic(title: "Title", value: "Value"),
    Statistic(title: "Title", value: "Value", percentageChange: -1),
    ]
    
    var body: some View {
        HStack(spacing: 20) {
            ForEach(statistics) { stat in
                StatisticView(stat: stat)
                    .frame(width: UIScreen.main.bounds.width * 0.33)
            }
        }
        .frame(width: UIScreen.main.bounds.width)
    }
}

struct HomeStatsView_Previews: PreviewProvider {
    static var previews: some View {
        GlobalMarketView()
    }
}
