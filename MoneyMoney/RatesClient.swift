//
//  RatesClient.swift
//  MoneyMoney
//
//  Created by Monica Giambitto on 26.02.21.
//

import Foundation

struct RatesClient {
    static let address = "https://api.exchangeratesapi.io/latest?base=EUR&symbols=USD,GBP"
    
    // closure
    static func loadRates(success: @escaping (ConversionRate) -> (), failure: @escaping () -> ()) {
        let url = URL(string: address)!

        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                guard let data = data,
                      let loadedObject = try? JSONDecoder().decode(ConversionRate.self, from: data)
                else {
                    failure()
                    return
                }
                
                success(loadedObject)
            }
        }
        
        task.resume()
    }
}
