//
//  Double.swift
//  CryptoKing
//
//  Created by Ovidio  on 6/23/22.
//

import Foundation

extension Double {
    
    /// Conversion of Double to Currency
    ///```
    /// Convert 1234.56 to $1,234.56
    ///```
    private var currencyFormatter2: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        
//      Will format between 2 decimal places
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    
    /// Conversion of Double to Currency as a String with 2 decimal places
    ///```
    /// Convert 1234.56 to "$1,234.56"
    ///```
    func asCurrencyWith2Decimals() -> String {
//      self is the current number we are accessing it from
//      In this case, that would be a Double
        let number = NSNumber(value: self)
        return currencyFormatter2.string(from: number) ?? "$0.00"
    }
    
    
    /// Conversion of Double to Currency
    ///```
    /// Convert 1234.56 to $1,234.56
    ///```
    private var currencyFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        
//      Will format between 2 and 6 decimal places
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 6
        return formatter
    }
    
    
    /// Conversion of Double to Currency as a String with 2-6 decimal places
    ///```
    /// Convert 1234.56 to "$1,234.56"
    ///```
    func asCurrencyWith6Decimals() -> String {
//      self is the current number we are accessing it from
//      In this case, that would be a Double
        let number = NSNumber(value: self)
        return currencyFormatter.string(from: number) ?? "$0.00"
    }
    
    
    /// Conversion of Double to String
    ///```
    /// Convert 1.234 to "1.23"
    ///```
    func asNumberString() -> String {
        return String(format: "%.2f", self)
    }
    
    
    /// Conversion of Double to String w/ percent symbol
    ///```
    /// Convert 1.234 to "%1.23"
    ///```
    func asPercentString() -> String {
        return asNumberString() + "%"
    }
    
}



