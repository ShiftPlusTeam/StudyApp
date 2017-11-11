//
//  Commentary.swift
//  StudyApp
//
//  Created by airshoh on 2017/10/27.
//  Copyright © 2017年 ShiftPlus+. All rights reserved.
//


import UIKit
import Realm

class CommentaryViewController: UIViewController{
    
    
    
    @IBOutlet weak var correctlabel: UILabel!
    @IBOutlet weak var optionlabel: UILabel!
    @IBOutlet weak var commentlabel: UILabel!
    
    //画像表示させる用(未実装)
    @IBOutlet weak var answerjudge: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //現在の問題を定義
        let results = AppDataController.getCurrentQuestionData()
        
        //回答した選択肢を定義
        let answer = AppDataController.selectAnswer
        
        //各種表示の更新
        optionlabel.text = answer
        commentlabel.text = results.comment
        correctlabel.text = results.answer
        
        //正誤判定(ゆくゆくは画像へ)
        if answer == correctlabel.text{
            correctlabel.text="◯";
        }else{
            correctlabel.text="×";
        }
        
    }
    
}


