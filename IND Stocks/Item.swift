//
//  Item.swift
//  IND Stocks
//
//  Created by yash-mac on 05/05/26.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
