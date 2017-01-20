//
//  TODOMainViewTableCell.swift
//  iOSHandsOn
//

import UIKit
import Foundation

class TODOMainViewTableCell: UITableViewCell {
    
    @IBOutlet weak var taskLabel: UILabel!
    
    var taskLabelText: String? {
        get {
            return taskLabel.text
        }
        set(text) {
            taskLabel.text = text
        }
    }
    
}
