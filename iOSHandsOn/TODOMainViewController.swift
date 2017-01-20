//
//  TODOMainViewController.swift
//  iOSHandsOn
//

import UIKit
import Foundation

class TODOMainViewController: UIViewController {
    
    @IBOutlet weak var dismissButton: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dismissButton.target = self
        dismissButton.action = #selector(TODOMainViewController.dismissButtonTapped(_:))
        
        let nib = UINib(nibName: "TODOMainViewTableCell", bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: "TODOMainViewTableCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func dismissButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension TODOMainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TODOMainViewTableCell") as? TODOMainViewTableCell {
            cell.taskLabelText = "row at: \(indexPath.item)"
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
}

extension TODOMainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NSLog("selected row at: \(indexPath.item)")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let action = UITableViewRowAction(style: .destructive, title: "Delete") { _,_ in
            NSLog("DeleteButton tapped: row at \(indexPath.item)")
        }
        return [action]
    }
    
}
