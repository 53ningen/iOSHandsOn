//
//  ViewController.swift
//  iOSHandsOn
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var pushButton: UIButton!
    @IBOutlet weak var popButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pushButton.addTarget(self, action: #selector(ViewController.pushButtonTapped(_:)), for: .touchUpInside)

        // 戻り先の画面が存在するときだけ、ボタンを有効にする
        popButton.isEnabled = navigationController!.childViewControllers.count > 1
        popButton.addTarget(self, action: #selector(ViewController.popButtonTapped(_:)), for: .touchUpInside)
    }
    
    // 画面が表示された直後に呼ばれる
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        NSLog("\(navigationController?.childViewControllers)")
    }
    
    func pushButtonTapped(_ sender: Any) {
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

    func popButtonTapped(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }
    
}
