//
//  StockModel.swift
//  IND Stocks
//
//  Created by yash-mac on 06/05/26.
//

import Foundation

//{
//        "ticker_id": "S0003074",
//        "company_name": "Titan Company",
//        "price": "4518.90",
//        "percent_change": "4.91",
//        "net_change": "211.40",
//        "bid": "4518.90",
//        "ask": "4519",
//        "high": "4605",
//        "low": "4213.40",
//        "open": "4314",
//        "low_circuit_limit": "3876.80",
//        "up_circuit_limit": "4738.20",
//        "volume": "4701998",
//        "date": "2026-05-08",
//        "time": "09:55:55",
//        "close": "4307.50",
//        "bid_size": "424",
//        "ask_size": "110",
//        "exchange_type": "NSI",
//        "lot_size": "1",
//        "overall_rating": "Bullish",
//        "short_term_trends": "Bullish",
//        "long_term_trends": "Bullish",
//        "total_share_outstanding": "88.70",
//        "year_low": "3245.50",
//        "year_high": "4554",
//        "ric": "TITN.NS"
//      },

struct StockAPIResponse: Decodable {
    let topGainers: [StockModel]
    let topLosers: [StockModel]
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let trendingStocks = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .tradingStocks)
        self.topGainers = try trendingStocks.decode([StockModel].self, forKey: .topGainers)
        self.topLosers = try trendingStocks.decode([StockModel].self, forKey: .topLosers)
    }
    
    enum CodingKeys: String, CodingKey {
        case tradingStocks = "trending_stocks"
        case topGainers = "top_gainers"
        case topLosers = "top_losers"
    }
    
}

struct StockModel: Codable, Identifiable {
    let tickerId: String
    let companyName: String
    let price: Double
    let percentChange: Double
    let netChange: Double
    let bid: Double
    let ask: Double
    let high: Double
    let low: Double
    let open: Double
    let lowCircuitLimit: Double
    let upCircuitLimit: Double
    let volume: Int
    let date: String
    let time: String
    let close: Double
    let bidSize: Int
    let askSize: Int
    let exchangeType: String
    let lotSize: Int
    let overallRating: String
    let shortTermTrends: String
    let longTermTrends: String
    let totalShareOutstanding: Double
    let yearLow: Double
    let yearHigh: Double
    let ric: String

    var id: String { tickerId }

    enum CodingKeys: String, CodingKey {
        case tickerId = "ticker_id"
        case companyName = "company_name"
        case price
        case percentChange = "percent_change"
        case netChange = "net_change"
        case bid
        case ask
        case high
        case low
        case open
        case lowCircuitLimit = "low_circuit_limit"
        case upCircuitLimit = "up_circuit_limit"
        case volume
        case date
        case time
        case close
        case bidSize = "bid_size"
        case askSize = "ask_size"
        case exchangeType = "exchange_type"
        case lotSize = "lot_size"
        case overallRating = "overall_rating"
        case shortTermTrends = "short_term_trends"
        case longTermTrends = "long_term_trends"
        case totalShareOutstanding = "total_share_outstanding"
        case yearLow = "year_low"
        case yearHigh = "year_high"
        case ric
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        tickerId = try container.decode(String.self, forKey: .tickerId)
        companyName = try container.decode(String.self, forKey: .companyName)
        price = Double(try container.decode(String.self, forKey: .price)) ?? 0.0
        percentChange = Double(try container.decode(String.self, forKey: .percentChange)) ?? 0.0
        netChange = Double(try container.decode(String.self, forKey: .netChange)) ?? 0.0
        bid = Double(try container.decode(String.self, forKey: .bid)) ?? 0.0
        ask = Double(try container.decode(String.self, forKey: .ask)) ?? 0.0
        high = Double(try container.decode(String.self, forKey: .high)) ?? 0.0
        low = Double(try container.decode(String.self, forKey: .low)) ?? 0.0
        open = Double(try container.decode(String.self, forKey: .open)) ?? 0.0
        lowCircuitLimit = Double(try container.decode(String.self, forKey: .lowCircuitLimit)) ?? 0.0
        upCircuitLimit = Double(try container.decode(String.self, forKey: .upCircuitLimit)) ?? 0.0
        volume = Int(try container.decode(String.self, forKey: .volume)) ?? 0
        date = try container.decode(String.self, forKey: .date)
        time = try container.decode(String.self, forKey: .time)
        close = Double(try container.decode(String.self, forKey: .close)) ?? 0.0
        bidSize = Int(try container.decode(String.self, forKey: .bidSize)) ?? 0
        askSize = Int(try container.decode(String.self, forKey: .askSize)) ?? 0
        exchangeType = try container.decode(String.self, forKey: .exchangeType)
        lotSize = Int(try container.decode(String.self, forKey: .lotSize)) ?? 0
        overallRating = try container.decode(String.self, forKey: .overallRating)
        shortTermTrends = try container.decode(String.self, forKey: .shortTermTrends)
        longTermTrends = try container.decode(String.self, forKey: .longTermTrends)
        totalShareOutstanding = Double(try container.decode(String.self, forKey: .totalShareOutstanding)) ?? 0.0
        yearLow = Double(try container.decode(String.self, forKey: .yearLow)) ?? 0.0
        yearHigh = Double(try container.decode(String.self, forKey: .yearHigh)) ?? 0.0
        ric = try container.decode(String.self, forKey: .ric)
    }

    // Regular initializer for manual creation
    init(
        tickerId: String,
        companyName: String,
        price: Double,
        percentChange: Double,
        netChange: Double,
        bid: Double,
        ask: Double,
        high: Double,
        low: Double,
        open: Double,
        lowCircuitLimit: Double,
        upCircuitLimit: Double,
        volume: Int,
        date: String,
        time: String,
        close: Double,
        bidSize: Int,
        askSize: Int,
        exchangeType: String,
        lotSize: Int,
        overallRating: String,
        shortTermTrends: String,
        longTermTrends: String,
        totalShareOutstanding: Double,
        yearLow: Double,
        yearHigh: Double,
        ric: String
    ) {
        self.tickerId = tickerId
        self.companyName = companyName
        self.price = price
        self.percentChange = percentChange
        self.netChange = netChange
        self.bid = bid
        self.ask = ask
        self.high = high
        self.low = low
        self.open = open
        self.lowCircuitLimit = lowCircuitLimit
        self.upCircuitLimit = upCircuitLimit
        self.volume = volume
        self.date = date
        self.time = time
        self.close = close
        self.bidSize = bidSize
        self.askSize = askSize
        self.exchangeType = exchangeType
        self.lotSize = lotSize
        self.overallRating = overallRating
        self.shortTermTrends = shortTermTrends
        self.longTermTrends = longTermTrends
        self.totalShareOutstanding = totalShareOutstanding
        self.yearLow = yearLow
        self.yearHigh = yearHigh
        self.ric = ric
    }
}

extension StockModel {
    static let mock = StockModel(
        tickerId: "S0003074",
        companyName: "Titan Company",
        price: 4518.90,
        percentChange: 4.91,
        netChange: 211.40,
        bid: 4518.90,
        ask: 4519.0,
        high: 4605.0,
        low: 4213.40,
        open: 4314.0,
        lowCircuitLimit: 3876.80,
        upCircuitLimit: 4738.20,
        volume: 4701998,
        date: "2026-05-08",
        time: "09:55:55",
        close: 4307.50,
        bidSize: 424,
        askSize: 110,
        exchangeType: "NSI",
        lotSize: 1,
        overallRating: "Bullish",
        shortTermTrends: "Bullish",
        longTermTrends: "Bullish",
        totalShareOutstanding: 88.70,
        yearLow: 3245.50,
        yearHigh: 4554.0,
        ric: "TITN.NS"
    )
}
