//
//  Question.swift
//  StudyApp
//
//  Created by 道正裕太 on 2017/08/17.
//  Copyright © 2017年 ShiftPlus+. All rights reserved.
//

import Foundation

//1つの問題に関する情報を格納するクラス
class Question {
    
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

//
