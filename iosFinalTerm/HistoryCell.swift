//
//  HistoryCell.swift
//  iosFinalTerm
//
//  Created by Thayllan Anacleto on 2018-12-13.
//  Copyright © 2018 Thayllan Anacleto. All rights reserved.
//

import UIKit

class HistoryCell: UITableViewCell {
    
    @IBOutlet weak var lblOutlet: UILabel!
    
    //var delegate: ChangeCalcStatus?
    var index: Int?
    var history: [History]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: false)
    }

}
