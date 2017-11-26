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
    
    //「Assets.xcassets」に入っている画像を定義する。
    @IBOutlet weak var imageView: UIImageView!
    
    var maruimage: UIImage!
    var batsuimage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // バンドルした画像ファイルを読み込み
        maruimage = UIImage(named: "mark_maru")
        batsuimage = UIImage(named: "mark_batsu")
        
        //現在の問題を定義
        let results = AppDataController.getCurrentQuestionData()
        
        //回答した選択肢を定義
        let answer = AppDataController.selectAnswer
        
        //各種表示の更新
        optionlabel.text = answer
        commentlabel.text = results.comment
        correctlabel.text = results.answer
        
        //正誤判定
        if answer == results.answer{
            imageView.image = maruimage;
        }else{
            imageView.image = batsuimage;
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    //解答数を定義する
    let answercount = AppDataController.currentCount
    //問題数選択画面で選択した値を定義する
    let selectcount = AppDataController.count
 
        
    //選択した問題数に達した場合、結果画面へ。達していない場合は、次の問いへ
    //「次へ」ボタンを押下後、問題数選択画面で選択した値と現在の回答数がイコールか判断
    @IBAction func nextbutton(_ sender: UIButton) {
    if selectcount == answercount {
        
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
