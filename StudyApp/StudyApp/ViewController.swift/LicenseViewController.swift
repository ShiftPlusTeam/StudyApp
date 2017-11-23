//
//  LicenseSelectViewController.swift
//  StudyApp
//
//  Created by Sasakura Hirofumi on 2017/09/16.
//  Copyright © 2017 ShiftPlus+. All rights reserved.
//
//
//✔︎資格の一覧が表示される。
//・資格を選択後「ジャンル選択画面」へ画面遷移する。
//✔︎資格の右の欄に解答済みと未回答の比率が表示される。
//✔︎未購入は、グレーアウトされて表示される。
//・資格名をバーに入れると検索が可能

import UIKit

class LicenseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //関連付けされたテーブルビュー
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //tableView.dataSource = self
        //tableView.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //セルに表示する行数を返す
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let realmControllerLicense = RealmControllerLicense()
        let results = realmControllerLicense.getResult()
        
        let count: Int = results.count
        //print(count)
        
        return count
    }
    
    //セルの高さの変更
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    //セルに値を設定するデータソースメソッド
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let realmControllerLicense = RealmControllerLicense()
        let results = realmControllerLicense.getResult()
        
        // セルを取得する
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "LicenseCell")
        
        
        let object = results[indexPath.row]
        
        // セルに表示する値を設定する
        cell.textLabel?.text = object.name
        //print(object.name)
        
        //未購入の場合はセルをグレーアウト
        if !(object.purshase) {
            cell.textLabel?.backgroundColor = UIColor.gray
        }
        
        //プログレスバーの表示
        let rate: Float = Float(object.rate / 100)
        
        var progressBar = cell.viewWithTag(1) as! UIProgressView?
        print(rate)
        progressBar?.progress = rate
        
        return cell
    }
    
    
    //セルがタップされた時に呼び出されるデリゲートメソッド
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //セルの選択解除
        tableView.deselectRow(at: indexPath, animated: true)
        
        let realmControllerLicense = RealmControllerLicense()
        let results = realmControllerLicense.getResult()
        let object = results[indexPath.row]
        
        //AppDataControllerの更新
        AppDataController.id = object.id
        //print(AppDataController.id)
        AppDataController.name = object.name
        //print(AppDataController.name)
        
        //ジャンル選択画面への画面遷移の実行
        let storyboard: UIStoryboard = self.storyboard!
        let nextView = storyboard.instantiateViewController(withIdentifier: "genre")
        self.present(nextView, animated: true, completion: nil)
        
        //遷移先の画面がある程度完成してから着手
        //self.present(GenreSelectViewController(), animated: true, completion: nil)
        
        let cell = tableView.cellForRow(at: indexPath)
        
        
    }
    
    
}
