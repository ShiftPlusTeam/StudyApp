//
//  Question.swift
//  StudyApp
//
//  Created by 道正裕太 on 2017/08/17.
//  Copyright © 2017年 ShiftPlus+. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class LicenseRealm: Object  {
    
    //資格一覧DB
    //Id:資格ID
    //Name:資格名
    //Rate:正答率
    //Purshase:購入済みであるかどうか
    @objc dynamic var id :String = ""
    @objc dynamic var name :String = ""
    @objc dynamic var rate :Int = 0
    @objc dynamic var purshase :Bool = false

}

class QuestionRealm :Object{
        
    //問題一覧
    //No:問題番号
    //LicenseId:資格ID
    //Genre:ジャンル
    //Problem:問題文
    //Comment:解説文
    //OptionA:選択肢
    //OptionB:選択肢
    //OptionC:選択肢
    //OptionD:選択肢
    //Answer:正解の選択肢
    //Correct:過去に正解したかどうか
    //Done:過去に回答したかどうか
        
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
    @objc dynamic var correct :Bool = false
    @objc dynamic var done :Bool = false
    
}

class ImportLicense {
    
    let realm = try! Realm()
    
    func LicenseToArray () {
        
        //csvのファイルパスを取得
        if let csvPath = Bundle.main.path(forResource: "License", ofType: "csv") {
            
            do {
                
                //csvのファイルのデータを所得
                let LicenseStr = try! String(contentsOfFile:csvPath, encoding:String.Encoding.utf8)
                
                //csvファイルを改行区切りで配列に格納
                let LicenseArr = LicenseStr.components(separatedBy: .newlines)
                //print(csvArr)
                
                for LicenseRow in LicenseArr {
                    
                    func addLicense(_ newlicenseCsvSent :String) {
                        let License = LicenseRealm()
                        let ally = newlicenseCsvSent.components(separatedBy: ",")
                        
                        License.name = ally[0]
                        License.id = ally[1]
                        License.rate = 0
                        License.purshase = false
                        
                        try! realm.write {
                            
                            realm.add(License)
                            
                        }
                    }
                }
            }
        }
    }
}

class ImportQuestion {
    
    let realm = try! Realm()
    
    func QuestionToArray () {
        
        //csvのファイルパスを取得
        if let csvPath = Bundle.main.path(forResource: "question", ofType: "csv") {
            do {
                
                //csvのファイルのデータを所得
                let QuestionStr = try! String(contentsOfFile:csvPath, encoding:String.Encoding.utf8)
                
                //csvファイルを改行区切りで配列に格納
                let QuestionArr = QuestionStr.components(separatedBy: .newlines)
                
                for QuestionRow in QuestionArr {
                    func addQuestion(_ newQuestionCsvSent :String) {
                        let Question = QuestionRealm()
                        let ally = newQuestionCsvSent.components(separatedBy: ",")
                        
                        //ダウンキャストがうまくいかないとエラーが起こるので、場合分け必須
                        Question.no = ally[0]
                        Question.licenseId = ally[1]
                        Question.genre = ally[2]
                        Question.problem = ally[3]
                        Question.comment = ally[4]
                        Question.optionA = ally[5]
                        Question.optionB = ally[6]
                        Question.optionC = ally[7]
                        Question.optionD = ally[8]
                        Question.answer = ally[9]
                        Question.correct = false
                        Question.done = false
                        
                        try! realm.write {
                            
                            realm.add(Question)
                            
                        }
                    }
                }
            }
        }
}
}
