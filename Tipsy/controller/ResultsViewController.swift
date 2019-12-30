//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Dylan Perry on 12/30/19.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var resultScreenLabel: UILabel!
    
    var tipPerPersonAmount: Double?
    var numberOfPeople: Int?
    var percentTip: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let _ = numberOfPeople,
            let _ = percentTip,
            let _ = tipPerPersonAmount else {
                view.backgroundColor = UIColor.red
                resultScreenLabel.text = "There was a problem figuring out the tip split."
                tipAmountLabel.text = "-1.00"
                return
        }
        tipAmountLabel.text = String(format: "%.2f", tipPerPersonAmount ?? 0.0)
        resultScreenLabel.text = "Split between \(numberOfPeople!) people, with \(String(format: "%.0f", percentTip!))% tip"
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalculateButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true) {
            print("Dismissed Results Screen")
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
