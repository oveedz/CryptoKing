//
//  HomeStatsView.swift
//  CryptoKing
//
//  Created by Ovidio  on 10/26/22.
//

import SwiftUI

struct HomeStatsView: View {
    
    let statistics: [Statistic] = [
    Statistic(title: "Title", value: "Value", percentageChange: 1),
    Statistic(title: "Title", value: "Value"),
    Statistic(title: "Title", value: "Value", percentageChange: -1),
    ]
    
    var body: some View {
        HStack(spacing: 20) {
            ForEach(self.statistics) { stat in
                StatisticView(stat: stat)
                    .padding()
            }
        }
    }
}

struct HomeStatsView_Previews: PreviewProvider {
    static var previews: some View {
        HomeStatsView()
    }
}
