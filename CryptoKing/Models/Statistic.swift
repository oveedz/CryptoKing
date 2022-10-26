//
//  StatisticsModel.swift
//  CryptoKing
//
//  Created by Ovidio  on 10/14/22.
//

import Foundation

struct Statistic: Identifiable {
    let id = UUID().uuidString
    let title: String
    let value: String
    let percentageChange: Double?
    
    
//  We're creating this init to give percentageChange (which is optional) a default value if it is not included
    init(title: String, value: String, percentageChange: Double? = nil) {
        self.title = title
        self.value = value
        self.percentageChange = percentageChange
    }
}
