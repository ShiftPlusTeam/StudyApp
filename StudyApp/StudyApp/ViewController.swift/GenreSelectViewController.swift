//
//  GenreSelectViewController.swift
//  StudyApp
//
//  Created by 正之 on 2017/10/28.
//  Copyright © 2017年 ShiftPlus+. All rights reserved.
//

import UIKit
import Foundation
class GenreSelectViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //暫定ジャンルリスト
    var genreList = ["GenreA","GenreB"]
    
    //関連付けされたテーブルビュー
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        genreList.append("Genre1")
        genreList.append("Genre2")
        print("\(genreList)")
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //セルに表示する行数を返す
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        let count: Int = genreList.count
        print("\(count)")
        return count
    }
    
    //セルの高さの変更
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    //セルに値を設定するデータソースメソッド
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        // セルを取得する
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "GenreCell")
        
        let object = genreList[indexPath.row]
        print("ジャンルのセル値\(object)")
        // セルに表示する値を設定する
        cell.textLabel?.text = object
        print(object)
        
        return cell
    }
    
    
    //セルがタップされた時に呼び出されるデリゲートメソッド
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("タップサイン_\(genreList[indexPath.row])")
    }
    
    
}

