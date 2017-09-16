//
//  Question.swift
//  StudyApp
//
//  Created by 道正裕太 on 2017/08/17.
//  Copyright © 2017年 ShiftPlus+. All rights reserved.
//

import UIKit

//問題クラス
class CSVController {
    
    let name = ""
    
    let csvArr = ""
    
    func csvToArray () {
        //csvのファイルパスを取得
        if let csvPath = Bundle.main.path(forResource: "question", ofType: "csv") {
            do {
                //csvのファイルのデータを所得
                let csvStr = try String(contentsOfFile:csvPath, encoding:String.Encoding.utf8)
                //csvファイルを改行区切りで配列に格納
                let csvArr = csvStr.components(separatedBy: .newlines)
                print(csvArr)
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
    }
    
    //所定の条件のもとで問題を作成する
    //各種フィールド値をセットしたら、このメソッドを実行する想定
    //てかこれを動かさず他のメソッドを動かすとやばい
    public func CSVimport() -> () {
        
        //RealmControllerQuestionのインスタンス生成
        //とりあえずの実装なので改修予定 20170911
        let realmControllerQuestion = RealmControllerQuestion(name)
        realmControllerQuestion.addQestion(csvArr)
        
    }
}







