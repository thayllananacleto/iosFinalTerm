//
//  NewCalcController.swift
//  iosFinalTerm
//
//  Created by Thayllan Anacleto on 2018-12-13.
//  Copyright © 2018 Thayllan Anacleto. All rights reserved.
//

import UIKit

protocol NewCalc {
    func newCalc(histDate: String, histWeight: Double, histBMI: String)
}

// Controller responsible for the new calc screen
class NewCalcController: UIViewController {

    @IBOutlet weak var histDate: UITextField!
    @IBOutlet weak var histWeight: UITextField!
    @IBOutlet weak var histHeight: UITextField!
    
    var delegate: NewCalc?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Create a new calc history when the user clicks on the button
    @IBAction func createCalc(_ sender: Any) {
        
        if histDate.text != "" && histWeight.text != "" && histHeight.text != "" {
            
            let weight: String = histWeight.text!
            let valWeight: Double = Double(weight)!
            let height: String = histHeight.text!
            let valHeight: Double = Double(height)!
            
            var bmi = 0.0
            bmi = ((valWeight / (valHeight * valHeight)))
            var bmiDesc: String = ""
            
            if (bmi < 16) {
                bmiDesc = "Severe Thinness"
            } else if (bmi >= 16 && bmi < 17) {
                bmiDesc = "Moderate Thinness"
            } else if (bmi >= 17 && bmi <= 18.5) {
                bmiDesc = "Mild Thinness"
            } else if (bmi > 18.5 && bmi <= 25) {
                bmiDesc = "Normal"
            } else if (bmi > 25 && bmi <= 30) {
                bmiDesc = "Overweight"
            } else if (bmi > 30 && bmi <= 35) {
                bmiDesc = "Obese Class I"
            } else if (bmi > 35 && bmi <= 40) {
                bmiDesc = "Obese Class II"
            } else if (bmi > 40) {
                bmiDesc = "Obese Class III"
            }
            
            delegate?.newCalc(histDate: histDate.text!, histWeight: valWeight, histBMI: bmiDesc)
            
        }
        
        
        navigationController?.popViewController(animated: true)
        
    }
}
