//
//  Double.swift
//  IND Stocks
//
//  Created by yash-mac on 06/05/26.
//

import Foundation
extension Double {
    private var currencyFormater: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "INR"
        return formatter
    }
    
    func asCurrency() -> String {
        currencyFormater.string(from: NSNumber(value: self)) ?? "-"
    }
    func asNumber() -> String {
        return String(format: "%0.2f", self)
    }
    func asPercent() -> String {
        return asNumber() + "%"
    }
}
