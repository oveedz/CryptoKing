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
            HStack {
                Text(stat.value)
                    .font(.headline)
                .foregroundColor(Color.theme.secondaryText)
                
                
                HStack(spacing: 0) {
                    Image(systemName: (stat.percentageChange ?? 0) >= 0 ? "plus" : "")
                        .font(.caption2)
                        .foregroundColor(.black)
                    Text(stat.percentageChange?.asPercentString() ?? "")
                        .font(.caption)
                        .foregroundColor(Color.black)
                }
                .padding(5)
                .overlay {
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(lineWidth: 2)
                        .fill(Color.green)
                }
                .background((stat.percentageChange ?? 0) >= 0 ? Color.green.opacity(0.7) : Color.red.opacity(0.7))
                .cornerRadius(20)
            }
            

//            Modifying the opacity as opposed to using an if let so when this object
//            is placed in a frame it stays aligned 
                .opacity(stat.percentageChange == nil ? 0 : 1.0)
            
        }
    }
}

struct StatisticView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticView(stat: dev.stat1)
    }
}
