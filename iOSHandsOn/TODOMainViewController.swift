//
//  TODOMainViewController.swift
//  iOSHandsOn
//

import UIKit
import Foundation

class TODOMainViewController: UIViewController {
    
    @IBOutlet weak var dismissButton: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addTaskTextField: UITextField!
    
    private let refreshControl: UIRefreshControl = UIRefreshControl()
    fileprivate var tasks: [String] = ["go to school", "go back home"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dismissButton.target = self
        dismissButton.action = #selector(TODOMainViewController.dismissButtonTapped(_:))
        
        refreshControl.addTarget(self, action: #selector(TODOMainViewController.onRefresh(_:)), for: .valueChanged)
        
        let nib = UINib(nibName: "TODOMainViewTableCell", bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: "TODOMainViewTableCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.addSubview(refreshControl)
        
        addTaskTextField.delegate = self
    }
    
    func dismissButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func onRefresh(_ sender: Any) {
        // refresh に2秒かかる処理と仮定した擬似コード
        DispatchQueue.global().async {
            sleep(2)
            DispatchQueue.main.async { [weak self] _ in
                self?.refreshControl.endRefreshing()
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        addTaskTextField.resignFirstResponder()
    }
    
}

extension TODOMainViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if let task = textField.text, task != "" {
            tasks.append(task)
            textField.text = ""
            tableView.reloadData()
        }
        return true
    }
    
}

extension TODOMainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TODOMainViewTableCell") as? TODOMainViewTableCell {
            cell.taskLabelText = tasks[indexPath.item]
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
        let action = UITableViewRowAction(style: .destructive, title: "Delete") { [weak self] _,_ in
            self?.tasks.remove(at: indexPath.item)
            tableView.reloadData()
        }
        return [action]
    }
    
}
