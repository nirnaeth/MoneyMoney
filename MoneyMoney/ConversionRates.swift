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

// {"rates":{"USD":1.0,"GBP":0.734421365},"base":"USD","date":"2021-01-19"}}
struct ConversionRate: Decodable {
    let rates: [Currency: Double]
    let base: Currency
}
