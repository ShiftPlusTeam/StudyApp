//
//  QuestionDataManager.swift
//  StudyApp
//
//  Created by 道正裕太 on 2017/08/20.
//  Copyright © 2017年 ShiftPlus+. All rights reserved.
//

import Foundation

//クイズデータの管理クラス
class QuestionDataManager {
    
    //シングルトン
    static let sharedinstance = QuestionDataManager()
    
    //問題文を格納する配列
    var questionDataArray = [QuestionData]()
    
    //現在の問題のインデックス
    var  nowQuestionIndex: Int = 0
    
    //初期化
    private init() {
        
    }
    //問題文の読み込み,getter
    func loadQuestion () {
        //格納済みの問題は削除
        questionDataArray.removeAll()
        //現在の問題のインデックスの初期化
        nowQuestionIndex = 0
        
        //csvファイルパス
        guard let csvFilePath = Bundle.main.Path(forResource: "question",ofType: "csv") else {
            //csvファイルなし
            print("csvファイルが存在しません")
            return
        }
        
        //csvファイル読み込み
        do {
            let csvStringData = try String(contentsOfFile: csvFilePath, encording: String.Encoding.utf8)
            //csvを1行ずつ読み込む
            csvStringData.enumerateLines(autoreleasepool(invoking: { (line, stop) in let questionSourceDataArray = line.components(separatedBy: ",")
                //問題文を格納するオブジェクト
                let questionData = QuestionData(questtionSourceDataArry: questionSourceDataArray)
                //問題を追加
                self.questionDataArray.append(questionData)
            })
        } catch let error {
            print("csvファイル読み込みエラー:\(error)")
            return
        }
        
    }
    
    //次の問題を取り出す
    func nextQuestion() -> QuestionData? {
        if nowQuestionIndex < questionDataArray.count {
            let nextquestion = questionDataArray[nowQuestionIndex]
            nowQuestionIndex += 1
            return nextquestion
        }
        return nil
    }
    
 
}
