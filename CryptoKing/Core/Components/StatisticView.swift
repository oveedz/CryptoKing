//
//  StatisticView.swift
//  CryptoKing
//
//  Created by Ovidio  on 10/14/22.
//

import SwiftUI

struct StatisticView: View {
    let stat: Statistic
    var body: some View {
        VStack(alignment: .leading, spacing: 4 ) {
            Text(stat.title)
                .font(.caption)
                .foregroundColor(Color.theme.secondaryText)
            Text(stat.value)
                .font(.headline)
                .foregroundColor(Color.theme.secondaryText)
            
                HStack {
                    Image(systemName: "triangle.fill")
                        .font(.caption2)
                        .rotationEffect(Angle(degrees: stat.percentageChange ?? 0 >= 0 ? 0:180))
                        .foregroundColor(stat.percentageChange ?? 0 > 0 ? .green : .red)
                    Text(stat.percentageChange?.asPercentString() ?? "")
                        .font(.caption)
                        .foregroundColor(Color.theme.secondaryText)
                }
//            Modifying the opacity as opposed to using an if let so when this object
//            is placed in a frame it stays aligned 
                .opacity(stat.percentageChange == nil ? 0 : 1.0)
            
        }
    }
}

struct StatisticView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticView(stat: dev.stat3)
    }
}
