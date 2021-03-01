//
//  ViewController.swift
//  MoneyMoney
//
//  Created by Monica Giambitto on 16.11.20.
//

//
// MVC is the usual pattern
// The main storyboar is the view, this is the controller
// Usually a VC is one screen. For simple UI it's enough, you can potentially have multiple VC for handling parts of a screen
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var appNameLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func convertButtonAction(_ sender: Any) {
        loadData()
        
    }
    
    func loadData() {
        RatesClient.loadRates { [weak self] (currentRate) in
            self?.updateUI(rate: currentRate)
        } failure: { [weak self] in
            self?.resultLabel.text = "Error while loading data"
        }
    }
    
    func updateUI(rate currentRate: ConversionRate) {
        let GBPConversionRate = currentRate.rates[.GBP] ?? 0
        let originalAmount = Double(self.textField.text ?? "") ?? 0
        let convertedAmount = originalAmount * GBPConversionRate
        self.resultLabel.text = "\(convertedAmount) \(Currency.GBP.rawValue)"
    }
}


// TODO: make it pretty - code & UI
// TODO: round to 2 decimals
// TODO: draw interface mockup
