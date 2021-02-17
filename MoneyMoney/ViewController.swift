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
    
    var convertedAmount:Double = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appNameLabel.text = "\(convertedAmount) Dollah"
        
        loadData()
    }

    @IBAction func convertButtonAction(_ sender: Any) {
        // Double initialized by a string
        let originalAmount = Double(textField.text ?? "") ?? 0
        
        
        appNameLabel.text = "\(originalAmount * 0.1) RubleS"
    }
    
    func loadData() {
        let url = URL(string: "https://api.exchangeratesapi.io/latest?base=USD&symbols=USD,GBP")!

        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            
//            print(String(data: data, encoding: .utf8)!)
//            print(String(data: data, encoding: .utf8)!)
//            print(String(data: data, encoding: .utf8)!)
            let loadedObject = try? JSONDecoder().decode(ConversionRate.self, from: data) // self to referencing the type
            //print(String(data: data, encoding: .utf8)!)
            print(loadedObject?.base)
        }

        task.resume()
    }
    
}

