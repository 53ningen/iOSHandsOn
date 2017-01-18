//
//  ViewController.swift
//  iOSHandsOn
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!

    @IBAction func buttonOnTouchUpInside(_ sender: Any) {
        let now = Date() // 現在時刻を取得
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ja_JP") // ロケールを指定
        dateFormatter.dateFormat = "yyyy/MM/dd HH:mm:ss" // 時刻表示のフォーマットを指定
        // 指定したフォーマットで現在時刻を取得してラベルに反映させる
        label.text = dateFormatter.string(from: now)
    }
    
}
