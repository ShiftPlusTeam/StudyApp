//
//  LicenseSelectViewController.swift
//  StudyApp
//
//  Created by Sasakura Hirofumi on 2017/09/16.
//  Copyright © 2017 ShiftPlus+. All rights reserved.
//
//
//・資格の一覧が表示される。
//・資格を選択後「ジャンル選択画面」へ画面遷移する。
//・資格の右の欄に解答済みと未回答の比率が表示される。
//・未購入は、グレーアウトされて表示される。
//・資格名をバーに入れると検索が可能

import UIKit

class LicenseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //関連付けされたテーブルビュー
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //セルに表示する文字列の個数を返す
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    //セルに値を設定するデータソースメソッド
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // セルを取得する
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "WeightCell")
        
        //let object = result?[indexPath.row]
        
        // セルに表示する値を設定する
        //cell.textLabel?.text = object?.name
        //cell.detailTextLabel?.text = (object?.rep)! + "レップ  " + (object?.set)! + "セット"
        cell.detailTextLabel?.textColor = UIColor.gray
        
        return cell
    }
    
    
    //セルがタップされた時に呼び出されるデリゲートメソッド
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        
        //選択したセルにチェックマークをつける
        cell?.accessoryType = .checkmark
    }
    
    
}
