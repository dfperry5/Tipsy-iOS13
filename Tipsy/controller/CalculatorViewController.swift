//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    
    @IBOutlet weak var billTotalTextField: UITextField!
    @IBOutlet weak var zeroPercentButton: UIButton!
    @IBOutlet weak var tenPercentButton: UIButton!
    @IBOutlet weak var twentyPercentButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tipCalculatorBrain = TipCalculatorBrain(splitNumber: 2, tipPercentage: 10.0)
    
    @IBAction func splitNumberStepperChanged(_ sender: UIStepper) {
        tipCalculatorBrain.splitNumber = Int(sender.value)
        splitNumberLabel.text = "\(tipCalculatorBrain.splitNumber)"
    }
    
    @IBAction func tipPercentChanged(_ sender: UIButton) {
        billTotalTextField.endEditing(true)
        guard let tipPercent = Double(sender.currentTitle!.dropLast()) else {
            print("Invalid Label")
            return
        }
        tipCalculatorBrain.tipPercentage = tipPercent
        deselectAllButtons()
        sender.isSelected = true
    }
    
    func deselectAllButtons(){
        zeroPercentButton.isSelected = false
        tenPercentButton.isSelected = false
        twentyPercentButton.isSelected = false
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "showResultsScreen", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print(segue.destination)
        
        guard let destinationVC = (segue.destination as? ResultsViewController),
             let currentTotal = billTotalTextField.text else {
            print("Invalid destination")
            return
        }
        destinationVC.numberOfPeople = tipCalculatorBrain.splitNumber
        destinationVC.percentTip = tipCalculatorBrain.tipPercentage
        destinationVC.tipPerPersonAmount = tipCalculatorBrain.calculateTip(totalCost: currentTotal)
        
    }
    
}

