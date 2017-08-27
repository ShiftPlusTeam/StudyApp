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
    
    //問題文
    @IBOutlet weak var question: UILabel!
    //問題文/getter/setter
    var questiontext: String {
        get {
            return String(question.text!)
        }
        set {
            question.text = "(nowQuestionText)"
        }
    }
    
    //解説文
    @IBOutlet weak var comment: UILabel!
    //解説文/getter/setter
    var commenttext: String {
        get {
            return String(comment.text!)
        }
        set {
            comment.text = "(nowCommentText)"
        }
    }
    
    //選択肢A
    @IBOutlet weak var optionA: UIButton!
    //選択肢A/getter/setter
    var optionAtitle: String {
        get {
            return String(describing: optionA.titleLabel!)
        }
        set {
            self.optionA.title
        }
    }

    //選択肢B
    @IBOutlet weak var optionB: UIButton!
    //選択肢B/getter/setter
    var optionBtitle: String {
        get {
            return String(describing: optionB.title)
        }
        set {
            self.optionB.title
        }
    }
    
    //選択肢C
    @IBOutlet weak var optionC: UIButton!
    //選択肢C/getter/setter
    var optionCtitle: String {
        get {
            return String(describing: optionC.title)
        }
        set {
            self.optionC.title
        }
    }
    
    //選択肢D
    @IBOutlet weak var optionD: UIButton!
    //選択肢D/getter/setter
    var optionDtitle: String {
        get {
            return String(describing: optionD.title)
        }
        set {
            self.optionD.title
        }
    }
    
    //正解
    @IBOutlet weak var correctanswer: UILabel!
    //正解/getter/setter
    var correctanswertext: String {
        get {
            return String(correctanswer.text!)
        }
        set {
            correctanswer.text = "(nowCorrectAnswerText)"
        }
    }
    
    //回答
    @IBOutlet weak var selectanswer: UILabel!
    //回答/getter/setter
    var selectanswertext: String {
        get {
            return String(selectanswer.text!)
        }
        set {
            selectanswer.text = "(nowSelectAnswerText)"
        }
   
    }

}







