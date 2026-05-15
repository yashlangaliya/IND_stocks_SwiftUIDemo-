//
//  HomeViewModel.swift
//  IND Stocks
//
//  Created by yash-mac on 13/05/26.
//

import Foundation

@MainActor
@Observable
class HomeViewModel {
    var topGainers: [StockModel] = []
    var topLosers: [StockModel] = []
    private let services = StockDataService()
    init() {
        Task {
            (self.topGainers, self.topLosers) = try await self.services.getStocks()
        }
    }
}
