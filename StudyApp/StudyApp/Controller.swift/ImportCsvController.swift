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

//class License: Object  {
//    //資格一覧DB
//    //Id:資格ID
//    //Name:資格名
//    //Rate:正答率
//    //Purshase:購入済みであるかどうか
//    @objc dynamic var id :String = ""
//    @objc dynamic var name :String = ""
//    @objc dynamic var rate : Int8 = 0
//    @objc dynamic var purshase :Bool = false
//
//}
//
//class Question :Object{
//    //問題一覧
//    //No:問題番号
//    //LicenseId:資格ID
//    //Genre:ジャンル
//    //Problem:問題文
//    //Comment:解説文
//    //OptionA:選択肢
//    //OptionB:選択肢
//    //OptionC:選択肢
//    //OptionD:選択肢
//    //Answer:正解の選択肢
//    //Correct:過去に正解したかどうか
//    //Done:過去に回答したかどうか
//
//    @objc dynamic var no :String = ""
//    @objc dynamic var licenseId :String = ""
//    @objc dynamic var genre :String = ""
//    @objc dynamic var problem :String = ""
//    @objc dynamic var comment :String = ""
//    @objc dynamic var optionA :String = ""
//    @objc dynamic var optionB :String = ""
//    @objc dynamic var optionC :String = ""
//    @objc dynamic var optionD :String = ""
//    @objc dynamic var answer :String = ""
//    @objc dynamic var correct :Bool = false
//    @objc dynamic var done :Bool = false
//
//    //回答が正解かどうかを返すメソッド
//    func getAnswers(_ selectedOption :String) -> Bool {
//        if selectedOption == answer {
//            return true
//        } else {
//            return false
//        }
//    }
//
//}

class ImportLicense {
    
    let realm = try! Realm()
    
    func LicenseToArray () {
        
        //csvのファイルパスを取得
        if let csvPath = Bundle.main.path(forResource: "license", ofType: "csv") {
            //            print(csvPath)
            
            do {
                //csvのファイルのデータを所得
                let LicenseStr = try! String(contentsOfFile:csvPath, encoding:String.Encoding.utf8)
                //                print(LicenseStr)
                //csvファイルを改行区切りで配列に格納
                let LicenseArr = LicenseStr.components(separatedBy: .newlines)
                //                print(LicenseArr)
                
                for LicenseRow in LicenseArr {
                    
                    let myLicense = License()
                    let ally = LicenseRow.components(separatedBy: ",")
                    
                    //allyの要素数を確認
                    if ally.count >= 4 {
                        
                        myLicense.id = ally[0]
                        print(myLicense.id)
                        myLicense.name = ally[1]
                        print(myLicense.name)
                        myLicense.rate = 0
                        print(myLicense.rate)
                        myLicense.purshase = false
                        print(myLicense.purshase)
                        
                        //CSV１レコード文の取得が完了
                        print("------------------------------")
                        print(myLicense)
                        print("------------------------------")
                        
                        try! realm.write {
                            realm.add(myLicense, update: true)
                        }
                    }
                }
            }
        } else {
            print("CSVファイルパスの取得失敗")
        }
    }
}

class ImportQuestion {
    
    let realm = try! Realm()
    
    func QuestionToArray () {
        
        //csvのファイルパスを取得
        if let csvPath = Bundle.main.path(forResource: "question", ofType: "csv") {
            //            print(csvPath)
            
            do {
                //csvのファイルのデータを所得
                let QuestionStr = try! String(contentsOfFile:csvPath, encoding:String.Encoding.utf8)
                //                print(QuestionStr)
                
                //csvファイルを改行区切りで配列に格納
                let QuestionArr = QuestionStr.components(separatedBy: .newlines)
                //                print(QuestionArr)
                
                
                for QuestionRow in QuestionArr {
                    
                    let myQuestion = Question()
                    let ally = QuestionRow.components(separatedBy: ",")
                    
                    //allyの要素数を確認
                    if ally.count >= 10 {
                        
                        //ダウンキャストがうまくいかないとエラーが起こるので、場合分け必須
                        myQuestion.id = ally[0]
                        print(myQuestion.id)
                        myQuestion.no = ally[1]
                        print(myQuestion.no)
                        myQuestion.licenseId = ally[2]
                        print(myQuestion.licenseId)
                        myQuestion.genre = ally[3]
                        print(myQuestion.genre)
                        myQuestion.problem = ally[4]
                        print(myQuestion.problem)
                        myQuestion.comment = ally[5]
                        print(myQuestion.comment)
                        myQuestion.optionA = ally[6]
                        print(myQuestion.optionA)
                        myQuestion.optionB = ally[7]
                        print(myQuestion.optionB)
                        myQuestion.optionC = ally[8]
                        print(myQuestion.optionC)
                        myQuestion.optionD = ally[9]
                        print(myQuestion.optionD)
                        myQuestion.answer = ally[10]
                        print(myQuestion.answer)
                        myQuestion.correct = false
                        print(myQuestion.correct)
                        myQuestion.done = false
                        print(myQuestion.done)
                        
                        //CSV１レコード文の取得が完了
                        print("------------------------------")
                        print(myQuestion)
                        print("------------------------------")
                        
                        try! realm.write {
                            realm.add(myQuestion, update: true)
                        }
                    }
                }
            }
        } else {
            print("CSVファイルパスの取得失敗")
        }
    }
}

class UpdateLicense {
    
    let realm = try! Realm()
    
    func LicenseToArray () {
        
        //csvのファイルパスを取得
        if let csvPath = Bundle.main.path(forResource: "license", ofType: "csv") {
            //            print(csvPath)
            
            do {
                //csvのファイルのデータを所得
                let LicenseStr = try! String(contentsOfFile:csvPath, encoding:String.Encoding.utf8)
                //                print(LicenseStr)
                //csvファイルを改行区切りで配列に格納
                let LicenseArr = LicenseStr.components(separatedBy: .newlines)
                //                print(LicenseArr)
                
                for LicenseRow in LicenseArr {
                    
                    let myLicense = License()
                    let ally = LicenseRow.components(separatedBy: ",")
                    
                    //allyの要素数を確認
                    if ally.count >= 4 {
                        
                        myLicense.id = ally[0]
                        print(myLicense.id)
                        myLicense.name = ally[1]
                        print(myLicense.name)
                        
                        //CSV１レコード文の取得が完了
                        print("------------------------------")
                        print(myLicense)
                        print("------------------------------")
                        
                        try! realm.write {
                            let License: [String: Any] = ["id": ally[0],
                                                          "name": ally[1]]
                            realm.create(Object.self,
                                         value: License,
                                         update: true)
                        }
                    }
                }
            }
        } else {
            print("CSVファイルパスの取得失敗")
        }
    }
}

class UpdateQuestion {
    
    let realm = try! Realm()
    
    func QuestionToArray () {
        
        //csvのファイルパスを取得
        if let csvPath = Bundle.main.path(forResource: "question", ofType: "csv") {
            //            print(csvPath)
            
            do {
                //csvのファイルのデータを所得
                let QuestionStr = try! String(contentsOfFile:csvPath, encoding:String.Encoding.utf8)
                //                print(QuestionStr)
                
                //csvファイルを改行区切りで配列に格納
                let QuestionArr = QuestionStr.components(separatedBy: .newlines)
                //                print(QuestionArr)
                
                for QuestionRow in QuestionArr {
                    
                    let myQuestion = Question()
                    let ally = QuestionRow.components(separatedBy: ",")
                    
                    //allyの要素数を確認
                    if ally.count >= 10 {
                        
                        //ダウンキャストがうまくいかないとエラーが起こるので、場合分け必須
                        myQuestion.id = ally[0]
                        print(myQuestion.id)
                        myQuestion.no = ally[1]
                        print(myQuestion.no)
                        myQuestion.licenseId = ally[2]
                        print(myQuestion.licenseId)
                        myQuestion.genre = ally[3]
                        print(myQuestion.genre)
                        myQuestion.problem = ally[4]
                        print(myQuestion.problem)
                        myQuestion.comment = ally[5]
                        print(myQuestion.comment)
                        myQuestion.optionA = ally[6]
                        print(myQuestion.optionA)
                        myQuestion.optionB = ally[7]
                        print(myQuestion.optionB)
                        myQuestion.optionC = ally[8]
                        print(myQuestion.optionC)
                        myQuestion.optionD = ally[9]
                        print(myQuestion.optionD)
                        myQuestion.answer = ally[10]
                        print(myQuestion.answer)
                        
                        //CSV１レコード文の取得が完了
                        print("------------------------------")
                        print(myQuestion)
                        print("------------------------------")
                        
                        try! realm.write {
                            let Question: [String: Any] = ["id": ally[0],
                                                           "no": ally[1],
                                                           "licenseId": ally[2],
                                                           "genre": ally[3],
                                                           "problem": ally[4],
                                                           "comment": ally[5],
                                                           "optionA": ally[6],
                                                           "optionB": ally[7],
                                                           "optionC": ally[8],
                                                           "optionD": ally[9],
                                                           "answer": ally[10]]
                            realm.create(Object.self,
                                         value: Question,
                                         update: true)
                        }
                    }
                }
            }
        } else {
            print("CSVファイルパスの取得失敗")
        }
    }
}
