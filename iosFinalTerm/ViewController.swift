//
//  ViewController.swift
//  iosFinalTerm
//
//  Created by Thayllan Anacleto on 2018-12-13.
//  Copyright © 2018 Thayllan Anacleto. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, NewCalc, ChangeCalcStatus {
    
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
        cell.lblOutlet.text = history[indexPath.row].calcName
        
        if history[indexPath.row].calcStatus {
            //cell.chkOutlet.setBackgroundImage(#imageLiteral(resourceName: "checked-checkbox"), for: UIControl.State.normal)
        } else {
            //cell.chkOutlet.setBackgroundImage(#imageLiteral(resourceName: "unchecked-checkbox"), for: UIControl.State.normal)
        }
        
        cell.delegate = self
        cell.index = indexPath.row
        cell.history = history
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController = segue.destination as! NewCalcController
        viewController.delegate = self
    }
    
    func newCalc(calcName: String) {
        history.append(History(calcName: calcName))
        tableView.reloadData()
    }
    
    func changeCalcStatus(checked: Bool, index: Int) {
        history[index].calcStatus = checked
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
    var calcName = ""
    var calcStatus = false
    
    convenience init(calcName: String) {
        self.init()
        self.calcName = calcName
    }
}
