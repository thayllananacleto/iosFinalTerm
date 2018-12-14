//
//  ViewController.swift
//  iosFinalTerm
//
//  Created by Thayllan Anacleto on 2018-12-13.
//  Copyright © 2018 Thayllan Anacleto. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, NewCalc {
    
    @IBOutlet weak var tableView: UITableView!
    
    var history: [History] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Determines how many rows it's gonna show in the Table View
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history.count
    }
    
    // Manipulate rows
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "historyCell", for: indexPath) as! HistoryCell
        cell.lblOutlet.text = history[indexPath.row].histDate + " - " + String(history[indexPath.row].histWeight) + " - " + String(history[indexPath.row].histBMI)
        
        //cell.delegate = self
        cell.index = indexPath.row
        cell.history = history
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController = segue.destination as! NewCalcController
        viewController.delegate = self
    }
    
    func newCalc(histDate: String, histWeight: Double, histBMI: String) {
        history.append(History(histDate: histDate, histWeight: histWeight, histBMI: histBMI))
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCell.EditingStyle.delete {
            history.remove(at: indexPath.row)
            tableView.reloadData()
        }
        
    }

}

class History {
    var histDate = ""
    var histWeight = 0.0
    var histBMI = ""
    
    convenience init(histDate: String, histWeight: Double, histBMI: String) {
        self.init()
        self.histDate = histDate
        self.histWeight = histWeight
        self.histBMI = histBMI
    }
}
