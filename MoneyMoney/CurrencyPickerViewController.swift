//
//  CurrencyPickerViewController.swift
//  MoneyMoney
//
//  Created by Monica Giambitto on 26.03.21.
//

import UIKit

class CurrencyPickerViewController: UIViewController {
    private let currencies: [Currency] = Currency.allCases
    
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    @IBAction func pickCurrency(_ sender: Any) {
        let selection = currencyPicker.selectedRow(inComponent: 0)
        let selectedCurrency = currencies[selection]
        
        print(selectedCurrency.rawValue) // NEXT x 2: show value on the interface
        
        dismiss(animated: true)
    }
}

extension CurrencyPickerViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        currencies.count
    }
}

extension CurrencyPickerViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        currencies[row].rawValue
    }
}
