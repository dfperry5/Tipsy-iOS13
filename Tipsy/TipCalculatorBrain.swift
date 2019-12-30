//
//  TipCalculatorBrain.swift
//  Tipsy
//
//  Created by Dylan Perry on 12/30/19.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct TipCalculatorBrain {
    var splitNumber: Int
    var tipPercentage: Double
    
    func calculateTip(totalCost: String) -> Double {
        guard let totalCost = Double(totalCost) else {
            print("Invalid Total cost passed in")
            return -1.0
        }
        return (  (totalCost + (totalCost * (tipPercentage/100) ) ) / Double(splitNumber))
        
    }
    
}
