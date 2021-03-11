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

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var convertButton: UIButton!
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    private let currencies: [Currency] = Currency.allCases
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "MoneyMoney 💲"
        // Type inference, therefore no need for specifying UIColor in front of the value
        convertButton.backgroundColor = .orange
        convertButton.layer.cornerRadius = 5
        
    }

    @IBAction func convertButtonAction(_ sender: Any) {
        loadData()
    }
    
    @IBAction func selectCurrencyAction() {
        currencyPicker.selectedRow(inComponent: 0)
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
        let convertedAmount = String(format: "%.2f", originalAmount * GBPConversionRate) // TODO: round to 2 decimals
        self.resultLabel.text = "\(convertedAmount) \(Currency.GBP.rawValue)"
    }
}

extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        currencies.count
    }
}

extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        currencies[row].rawValue
    }
}

// TODO: make it pretty - code & UI
