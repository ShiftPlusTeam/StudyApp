//
//  Question.swift
//  StudyApp
//
//  Created by 道正裕太 on 2017/08/17.
//  Copyright © 2017年 ShiftPlus+. All rights reserved.
//

import UIKit
import AudioToolbox

//1つの問題に関する情報を格納するクラス
class QuestionData {
    
    init(questionSourceDataArray: [String]) {
        question = questionSourceDataArray[0]
        optionA = questionSourceDataArray[1]
        optionB = questionSourceDataArray[2]
        optionC = questionSourceDataArray[3]
        optionD = questionSourceDataArray[4]
        correctAnswer = questionSourceDataArray[5]
        comment = questionSourceDataArray[6]
    }
    
    //　シングルトンオブジェクトの宣言
    static let sharedInstance = QuestionData()
    
    var questionDataArray = [QuestionData]()
    var nowQuestionIndex: Int = 0
    
    // 初期化処理
    // シングルトンを保証するためにprivateで宣言する
    private init() {
        
    }
    
    // CSVファイルから問題文を読み込む処理（relumeはようわからん）
    func loadQuestion() {
        
        // 格納済みの問題文の削除
        questionDataArray.removeAll()
        
        // 問題文のIndexを初期化
        nowQuestionIndex = 0
        
        // CSVファイルパスの取得
        guard let csvFilePath = Bundle.main.path(forResource: "question", ofType: "csv") else {
            print("csvファイルが存在しません")
            return
        }
        // ファイル内容の取得
        do {
            let csvStringData = try String(contentsOfFile: csvFilePath, encoding: String.Encoding.utf8)
            
            // csvデータを1行ずつ読み込む
            csvStringData.enumerateLines(invoking: { (line, stop) in
                // カンマ区切りで分割
                let questionSourceDataArray = line.components(separatedBy: ",")
                // 問題データを格納するオブジェクトを作成
                let questionData = QuestionData(questionSourceDataArray: questionSourceDataArray)
                // 問題を追加
                self.questionDataArray.append(questionData)
                // 問題番号を設定
                questionData.questionNo = self.questionDataArray.count
            })
        } catch let error {
            print("csvファイル読み込みエラーが発生しました:\(error)")
            return
        }
    }
    
    //問題文
    var question: String = "問題文"
    
    //問題文のgetter
    public func getQuestionName() -> (String) {
        return question
    }
    
    //問題文のsetter
    public func setQuestionName(question: String) {
        let question = QuestionData.question
    }
    
    //解説文
    var comment: String = "解説文"
    
    //問題文のgetter
    public func getCommentName() -> (String) {
        return comment
    }
    
    //問題文のsetter
    public func setCommentName(question: String) {
        let question = QuestionData.comment
    }
    
    //選択肢A
    var optionA: String = "A"
    
    //選択肢B
    var optionB: String = "B"
    
    //選択肢C
    var optionC: String = "C"
    
    //選択肢D
    var optionD: String = "D"
    
    //正解の番号
    var correctAnswer: String = "X"
    
    //選択された番号
    var ChoiceAnswer: String = "Y"
    
    //問題の番号
    var questionNo: Int = 0
    
    //選択された番号が正解か判定する
    func isCorrect() -> Bool {
        
        //答えが一致しているか判定する
        if correctAnswer == ChoiceAnswer {
            
            //正解
            return true
        }
        
        //不正解
        return false
    }
    
    
    
    
    
    
    
    
    
}






