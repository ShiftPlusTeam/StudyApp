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

class License: Object  {
    //資格一覧DB
    //Id:資格ID
    //Name:資格名
    //Rate:正答率
    //Purshase:購入済みであるかどうか
    @objc dynamic var id :String = ""
    @objc dynamic var name :String = ""
    @objc dynamic var rate : Int8 = 0
    @objc dynamic var purshase :Bool = false
    
}

class Question :Object{
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
    
    //回答が正解かどうかを返すメソッド
    func getAnswes(_ selectedOption :String) -> Bool {
        if selectedOption == answer {
            return true
        } else {
            return false
        }
    }
    
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
                        let myLicense = License()
                        let ally = newlicenseCsvSent.components(separatedBy: ",")
                        
                        myLicense.name = ally[0]
                        myLicense.id = ally[1]
                        myLicense.rate = 0
                        myLicense.purshase = false
                        
                        try! realm.write {
                            
                            realm.add(myLicense)
                            
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
                        let myQuestion = Question()
                        let ally = newQuestionCsvSent.components(separatedBy: ",")
                        
                        //ダウンキャストがうまくいかないとエラーが起こるので、場合分け必須
                        myQuestion.no = ally[0]
                        myQuestion.licenseId = ally[1]
                        myQuestion.genre = ally[2]
                        myQuestion.problem = ally[3]
                        myQuestion.comment = ally[4]
                        myQuestion.optionA = ally[5]
                        myQuestion.optionB = ally[6]
                        myQuestion.optionC = ally[7]
                        myQuestion.optionD = ally[8]
                        myQuestion.answer = ally[9]
                        myQuestion.correct = false
                        myQuestion.done = false
                        
                        try! realm.write {
                            
                            realm.add(myQuestion)
                            
                        }
                    }
                }
            }
        }
}
}
