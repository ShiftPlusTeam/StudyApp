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
    
    let answercounter = AppDataController.currentCount
    let selectcount = AppDataController.count
 
        
    //選択した問題数に達した場合、結果画面へ。達していない場合は、次の問いへ
    //「次へ」ボタンを押下後、問題数選択画面で選択した値と現在の回答数がイコールか判断
    @IBAction func nextbutton(_ sender: UIButton) {
    if selectcount == answercounter {
        
        //イコールの場合、結果画面へ遷移する。↓参照元
        //<https://i-app-tec.com/ios/tap_gesture.html>
        performSegue(withIdentifier: "goRecord",sender: nil)
    } else {
        
        //イコールではない場合、前の画面へ戻る。↓参照元
        //<http://appleharikyu.jp/iphone/?p=1074>
        self.dismiss(animated: true, completion: nil)
    
            }
        }
    }
