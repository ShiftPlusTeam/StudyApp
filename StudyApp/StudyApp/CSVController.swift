//
//  Question.swift
//  StudyApp
//
//  Created by 道正裕太 on 2017/08/17.
//  Copyright © 2017年 ShiftPlus+. All rights reserved.
//

import UIKit

//CSVクラス
class CSVController {
    
    let name = "test"
    
    func LicenseToArray () {
        
        //csvのファイルパスを取得
        if let csvPath = Bundle.main.path(forResource: "License", ofType: "csv") {
            do {
                
                //RealmControllerLicenseのインスタンス生成
                let realmControllerLicense = RealmControllerLicense(name)
                
                //csvのファイルのデータを所得
                let LicenseStr = try String(contentsOfFile:csvPath, encoding:String.Encoding.utf8)
                
                //csvファイルを改行区切りで配列に格納
                let LicenseArr = LicenseStr.components(separatedBy: .newlines)
                //print(csvArr)
                
                for LicenseRow in LicenseArr {
                    realmControllerLicense.addLicense(LicenseRow)
                }
                
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
        
    }
    
    func QuestionToArray () {
        
        //csvのファイルパスを取得
        if let csvPath = Bundle.main.path(forResource: "question", ofType: "csv") {
            do {
                
                //RealmControllerQuestionのインスタンス生成
                let realmControllerQuestion = RealmControllerQuestion(name)
                
                //csvのファイルのデータを所得
                let QuestionStr = try String(contentsOfFile:csvPath, encoding:String.Encoding.utf8)
                
                //csvファイルを改行区切りで配列に格納
                let QuestionArr = QuestionStr.components(separatedBy: .newlines)
                //print(csvArr)
                
                for QuestionRow in QuestionArr {
                    realmControllerQuestion.addQestion(QuestionRow)
                }
                
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
        
    }
}







