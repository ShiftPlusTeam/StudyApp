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

class ImportLicense {
    
    let realm = try! Realm()
    
    func LicenseToArray () {
        
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
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
                        myLicense.purshase = true
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
            print("資格更新失敗")
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
                        
                        //CSV１レコード文の取得が完了
                        print("------------------------------")
                        print(myQuestion)
                        print("------------------------------")
                        
                        try! realm.write {
                            let myQuestion: [String: Any] = ["id": ally[0],
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
                                         value: myQuestion,
                                         update: true)
                        }
                    }
                }
            }
        } else {
            print("問題更新失敗")
        }
    }
}
