//
//  ViewController.swift
//  iOSHandsOn
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!

    @IBAction func buttonOnTouchUpInside(_ sender: Any) {
        // Main.storyboard を取得
        // Main.storyboard の InitialViewController は
        // UINavigationController なので as! 以後はそれを指定
        let nvc = UIStoryboard(name: "Main", bundle: Bundle.main)
            .instantiateInitialViewController() as! UINavigationController
        
        // 遷移先としたいの ViewController は 
        // childViewControllers の 1つ目の要素なので
        let vc = nvc.childViewControllers[0] as! ViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    // 画面が表示された直後に呼ばれる
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        NSLog("\(navigationController?.childViewControllers)")
    }
    
}
