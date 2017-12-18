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
    
    //関連付けされたテーブルビュー
    @IBOutlet weak var tableView: UITableView!
    var genreList = Array<String>()
    
    override func viewDidLoad() {
        //ここでRealmControllerQuestionのgetGenreを呼び出したいのだが、すでに前のページでインスタンスを作ってしまっている件（Realmのインスタンスをそう何個もホイホイ作りたくない）
        //できれば、AppdataControllerで一個のRealmControllerインスタンスを作ってもらうか、RealmcontrollerクラスをStatic化したい
        //一応以ここから
        print("\(AppDataController.id)")
        let realmController = RealmControllerQuestion(AppDataController.id)
        let genles = realmController.getGenres()
        for i in 0..<(genles.count) {
            genreList.append(genles[i])
        }
        genreList.append("Genre1")
        genreList.append("Genre2")
        //ここまでの方法でジャンル一覧は持ってこれるはず
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
        
        AppDataController.genre = [genreList[indexPath.row]]
        //AppDataController.genreId = [genreIdList[indexPath.row]]
        //↑AppDataControllerにgenreId作って
        
        //次頁、問題表示画面へ遷移
        tableView.deselectRow(at: indexPath, animated: true)
        let storyboard: UIStoryboard = self.storyboard!
        let nextView = storyboard.instantiateViewController(withIdentifier: "SelectQuestion")
        
        self.navigationController?.pushViewController(nextView, animated: true)
        
    }
    
    
}

