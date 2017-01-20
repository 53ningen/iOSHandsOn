//
//  ViewController.swift
//  iOSHandsOn
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var pushButton: UIButton!
    @IBOutlet weak var popButton: UIButton!
    @IBOutlet weak var modalButton: UIButton!
    @IBOutlet weak var dismissButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pushButton.addTarget(self, action: #selector(ViewController.pushButtonTapped(_:)), for: .touchUpInside)

        // プッシュの戻り先の画面が存在するときだけ、ボタンを有効にする
        popButton.isEnabled = navigationController!.childViewControllers.count > 1
        popButton.addTarget(self, action: #selector(ViewController.popButtonTapped(_:)), for: .touchUpInside)
        
        modalButton.addTarget(self, action: #selector(ViewController.modalButtonTapped(_:)), for: .touchUpInside)
        
        // モーダルの戻り先が存在するときだけボタンを有効にする
        dismissButton.isEnabled = presentingViewController != nil
        
        // UIBarButtonItem のイベント処理指定は UIButton と少し異なる
        dismissButton.target = self
        dismissButton.action = #selector(ViewController.dismissButtonTapped(_:))
    }
    
    // 画面が表示された直後に呼ばれる
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        NSLog("presentingVC: \(presentingViewController)")
        NSLog("nvc: \(navigationController!.childViewControllers)")
    }
    
    func pushButtonTapped(_ sender: Any) {
        let nvc = UIStoryboard(name: "Main", bundle: Bundle.main)
            .instantiateInitialViewController() as! UINavigationController
        let vc = nvc.childViewControllers[0] as! ViewController
        navigationController?.pushViewController(vc, animated: true)
    }

    func popButtonTapped(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    func modalButtonTapped(_ sender: Any) {
        // モーダル遷移
        let nvc = UIStoryboard(name: "Main", bundle: Bundle.main)
            .instantiateInitialViewController() as! UINavigationController
        present(nvc, animated: true, completion: nil)
    }
    
    func dismissButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
