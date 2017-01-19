//
//  ViewController.swift
//  iOSHandsOn
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!

    @IBAction func buttonOnTouchUpInside(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: Bundle.main)
            .instantiateViewController(withIdentifier: "Main") as! ViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    // 画面が表示された直後に呼ばれる
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        NSLog("\(navigationController?.childViewControllers)")
    }
    
}
