//
//  ConversionRates.swift
//  MoneyMoney
//
//  Created by Monica Giambitto on 20.01.21.
//

import Foundation

enum Currency: String, Decodable, CaseIterable {
    case USD
    case GBP
    case EUR
    case YEN
}

// {
//        "rates":{
//            "USD":1.0,
//            "GBP":0.734421365
//        },
//        "base": "USD",
//        "date": "2021-01-19"
//    } https://ratesapi.io/
//
//struct ConversionRate: Decodable {
//    let rates: [Currency: Double]
//    let base: Currency
//}

// {
//    "success": true,
//    "terms": "https:\/\/currencylayer.com\/terms",
//    "privacy": "https:\/\/currencylayer.com\/privacy",
//    "timestamp": 1620785583,
//    "source": "USD",
//    "quotes": {
//        "USDAED": 3.673197,
//        "USDAFN": 78.511138,
//        }
// }

struct ConversionRate: Decodable {
    let quotes: [String: Double]
    let source: Currency
}
