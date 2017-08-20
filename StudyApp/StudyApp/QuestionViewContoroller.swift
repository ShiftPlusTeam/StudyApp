//
//  QuestionViewContoroller.swift
//  StudyApp
//
//  Created by 道正裕太 on 2017/08/20.
//  Copyright © 2017年 ShiftPlus+. All rights reserved.
//

import UIKit
import AudioToolbox

class QuestionViewController: UIViewController {
    
    var questionData: QuestionData!
    @IBOutlet weak var questionNoLabel: UILabel!      //問題番号ラベル
    @IBOutlet weak var questionTextView: UITextView!  //問題文テキスト
    @IBOutlet weak var OptionAButton: UIButton!       //選択肢A
    @IBOutlet weak var OptionBButton: UIButton!       //選択肢B
    @IBOutlet weak var OptionCButton: UIButton!       //選択肢C
    @IBOutlet weak var OptionDButton: UIButton!       //選択肢D
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //初期データ設定、問題番号、問題文、選択肢のSetter
        questionNoLabel.text = "Q.\(questionData.questionNo)"
        questionTextView.text = questionData.question
        OptionAButton.setTitle(questionData.optionA, for: UIControlState.normal)
        OptionBButton.setTitle(questionData.optionB, for: UIControlState.normal)
        OptionCButton.setTitle(questionData.optionC, for: UIControlState.normal)
        OptionDButton.setTitle(questionData.optionD, for: UIControlState.normal)
    }
    
    
    
}
