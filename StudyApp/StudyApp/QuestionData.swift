//
//  Question.swift
//  StudyApp
//
//  Created by 道正裕太 on 2017/08/17.
//  Copyright © 2017年 ShiftPlus+. All rights reserved.
//

import Foundation

//1つの問題に関する情報を格納するクラス
class QuestionData {
    
    //問題文
    var question: String = "問題文"
    
    //解説文
    var comment: String = "解説文"
    
    //選択肢A
    var optionA: String = "A"
    
    //選択肢B
    var optionB: String = "B"
    
    //選択肢C
    var optionC: String = "C"
    
    //選択肢D
    var optionD: String = "D"
    
    //正解の番号
    var correctAnswer: String = "A"
    
    //選択された番号
    var ChoiceAnswer: String = "A"
    
    //問題の番号
    var questionNo: String = "A"
    
    
    //クラスが生成されたときの処理
    //    init(questionSourceDataArray: [String]) {
    //        question = questionSourceDataArray[0]
    //        answerA = questionSourceDataArray[1]
    //        answerB = questionSourceDataArray[2]
    //        answerC = questionSourceDataArray[3]
    //        answerD = questionSourceDataArray[4]
    //        correctAnswer = Int(questionSourceDataArray[5])!
    //    }
    //
    
    
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
