//
//  TODOMainViewController.swift
//  iOSHandsOn
//

import UIKit
import Foundation

class TODOMainViewController: UIViewController {
    
    @IBOutlet weak var dismissButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dismissButton.target = self
        dismissButton.action = #selector(TODOMainViewController.dismissButtonTapped(_:))
    }
    
    func dismissButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
