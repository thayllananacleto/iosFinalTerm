//
//  NewCalcController.swift
//  iosFinalTerm
//
//  Created by Thayllan Anacleto on 2018-12-13.
//  Copyright © 2018 Thayllan Anacleto. All rights reserved.
//

import UIKit

protocol NewCalc {
    func newCalc(calcName: String)
}

// Controller responsible for the new calc screen
class NewCalcController: UIViewController {

    @IBOutlet weak var calcNameOutlet: UITextField!
    var delegate: NewCalc?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Create a new calc history when the user clicks on the button
    @IBAction func createCalc(_ sender: Any) {
        
        if calcNameOutlet.text != "" {
            delegate?.newCalc(calcName: calcNameOutlet.text!)
            navigationController?.popViewController(animated: true)
        }
        
    }
}
