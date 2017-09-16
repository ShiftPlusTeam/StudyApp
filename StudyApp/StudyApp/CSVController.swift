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
    
    let name = ""
    
    
    func csvToArray () {
        
        //csvのファイルパスを取得
        if let csvPath = Bundle.main.path(forResource: "question", ofType: "csv") {
            do {
                
                //RealmControllerQuestionのインスタンス生成
                let realmControllerQuestion = RealmControllerQuestion(name)
                
                //csvのファイルのデータを所得
                let csvStr = try String(contentsOfFile:csvPath, encoding:String.Encoding.utf8)
                
                //csvファイルを改行区切りで配列に格納
                let csvArr = csvStr.components(separatedBy: .newlines)
                //print(csvArr)
                
                for csvRow in csvArr {
                    realmControllerQuestion.addQestion(csvRow)
                }
                
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
        
    }
}







