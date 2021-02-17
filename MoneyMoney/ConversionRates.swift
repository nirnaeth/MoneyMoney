//
//  ConversionRates.swift
//  MoneyMoney
//
//  Created by Monica Giambitto on 20.01.21.
//

import Foundation

enum Currency: String, Decodable {
    case USD
    case GBP
    case EUR
}

// {"rates":{"USD":1.0,"GBP":0.734421365},"base":"USD","date":"2021-01-19"}}
struct ConversionRate: Decodable {
    let rates: [Currency: Double]
    let base: Currency
}
