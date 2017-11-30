//
//  RealmTables.swift
//  StudyApp
//
//  Created by 正之 on 2017/11/26.
//  Copyright © 2017年 ShiftPlus+. All rights reserved.
//

import Foundation
import Foundation
import UIKit
import RealmSwift

class LicenseData: Object  {
    //資格一覧テーブル　資格IDと資格名を持つ
    //id:問題ID:主キー//◾️◾️◾️桁数要相談◾️◾️◾️
    //name:資格名
    @objc dynamic var id :String = ""
    @objc dynamic var name :String = ""
    
    //主キー指定
    override static func primaryKey() -> String? {
        return "id"
    }
}

class LicenseHist: Object  {
    //資格一覧更新情報テーブル　資格一覧データベースと資格IDでひも付き、正答率、入手済みなどの更新履歴を持つ
    //id:問題ID:主キー//◾️◾️◾️桁数要相談◾️◾️◾️
    //rate:その資格の問題全体における正答率
    //purshase:その資格の問題情報を購入済みであるかどうか
    @objc dynamic var id :String = ""
    @objc dynamic var rate : Int8 = 0
    @objc dynamic var purshase :Bool = false
    
    //主キー指定
    override static func primaryKey() -> String? {
        return "id"
    }
}

class QuestionData :Object{
    //問題一覧テーブル　問題IDと、各問題の構成情報を持つ
    //id:問題ID:主キー//◾️◾️◾️桁数要相談◾️◾️◾️
    //no:問題番号
    //licenseId:資格ID
    //genre:ジャンル
    //problem:問題文
    //comment:解説文
    //optionA:選択肢
    //optionB:選択肢
    //optionC:選択肢
    //optionD:選択肢
    //answer:正解の選択肢(記号)
    @objc dynamic var id :String = ""
    @objc dynamic var no :String = ""
    @objc dynamic var licenseId :String = ""
    @objc dynamic var genre :String = ""
    @objc dynamic var problem :String = ""
    @objc dynamic var comment :String = ""
    @objc dynamic var optionA :String = ""
    @objc dynamic var optionB :String = ""
    @objc dynamic var optionC :String = ""
    @objc dynamic var optionD :String = ""
    @objc dynamic var answer :String = ""
    
    //主キー指定
    override static func primaryKey() -> String? {
        return "id"
    }
    
    //回答が正解かどうかを返すメソッド
    func getAnswes(_ selectedOption :String) -> Bool {
        if selectedOption == answer {
            return true
        } else {
            return false
        }
    }
}


class QuestionHist :Object{
    //問題一覧更新情報テーブル　問題一覧テーブルと問題IDでひも付き、過去１回の成否と回答済みであるかどうかを更新履歴としてもつ
    //id:問題ID:主キー//◾️◾️◾️桁数要相談◾️◾️◾️
    //correct:過去に正解したかどうか
    //done:過去に回答したかどうか
    
    @objc dynamic var id :String = ""
    @objc dynamic var correct :Bool = false
    @objc dynamic var done :Bool = false
    
    //主キー指定
    override static func primaryKey() -> String? {
        return "id"
    }
}

