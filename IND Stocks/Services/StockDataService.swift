//
//  StockDataService.swift
//  IND Stocks
//
//  Created by yash-mac on 13/05/26.
//

import Foundation


class StockDataService {
    
    func getStocks() async throws -> ([StockModel], [StockModel]) {
        guard let url = URL(string: "https://stock.indianapi.in/trending") else { throw URLError(.badURL) }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let apiKey = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String ?? ""
        request.setValue(apiKey, forHTTPHeaderField: "x-api-key")
        request.setValue("application/json", forHTTPHeaderField: "Accept")

        let (data, response) = try await URLSession.shared.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }
        let result = try JSONDecoder().decode(StockAPIResponse.self, from: data)
        
        return (result.topGainers, result.topLosers)
    }
}
