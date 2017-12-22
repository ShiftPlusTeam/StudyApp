//
//  Commentary.swift
//  StudyApp
//
//  Created by airshoh on 2017/10/27.
//  Copyright © 2017年 ShiftPlus+. All rights reserved.
//


import UIKit
import RealmSwift

class CommentaryViewController: UIViewController{
    
    //正解
    @IBOutlet weak var correctlabel: UILabel!
    //解説
    @IBOutlet weak var commentlabel: UILabel!
    //解答が正解か不正解かの画像を表示
    @IBOutlet weak var imageView: UIImageView!
    
    //「Assets.xcassets」に入っている画像を定義する。
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
        commentlabel.text = results.comment
        correctlabel.text = results.answer
        
        //正誤判定
        if answer == correctlabel.text{
            imageView.image = maruimage;
        }else{
            imageView.image = batsuimage;
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
<<<<<<< HEAD
    //ここから下のわけがわからない実装は何？？？？？？？？
    //なぜ一度変数を置き換える？？？？？？
    
    //    //解答数を定義する
    //    let answercount = AppDataController.currentCount
    //    //問題数選択画面で選択した値を定義する
    //    let selectcount = AppDataController.count
    
    
=======
    //解答数を定義する
    var answercount = AppDataController.currentCount
    //問題数選択画面で選択した値を定義する
    let selectcount = AppDataController.count
 
        
>>>>>>> b04bf48299384163c2a1438ef19ce01b41ca0362
    //選択した問題数に達した場合、結果画面へ。達していない場合は、次の問いへ
    //「次へ」ボタンを押下後、問題数選択画面で選択した値と現在の回答数がイコールか判断
    @IBAction func nextbutton(_ sender: UIButton) {
        //ここでcurrentCountをインクリメント
        AppDataController.incrementCurrentCount()
        
<<<<<<< HEAD
        if AppDataController.count <= AppDataController.currentCount {
            
            //次画面への遷移
            performSegue(withIdentifier: "goRecord",sender: nil)
            //            let storyboard: UIStoryboard = self.storyboard!
            //            let nextView = storyboard.instantiateViewController(withIdentifier: "record")
            //            self.present(nextView, animated: true, completion: nil)
            //            イコールの場合、結果画面へ遷移する。↓参照元
            //            <https://i-app-tec.com/ios/tap_gesture.html>
            //            performSegue(withIdentifier: "goRecord",sender: nil)
            
        } else {
            performSegue(withIdentifier: "backQuestion",sender: nil)
            //            イコールではない場合、前の画面へ戻る。↓参照元
            //            <http://appleharikyu.jp/iphone/?p=1074>
            //            self.dismiss(animated: true, completion: nil)
            
        }
        
        // Realm更新（未実装）
        // let realm = try! Realm()
        // let result = try! Realm().objects(License.self)
        
        // try! realm.write {
        //     nextbutton = newValue.Realm
        
=======
        if selectcount == answercount {
        
        //イコールの場合、結果画面へ遷移する。↓参照元
        //<https://i-app-tec.com/ios/tap_gesture.html>
        performSegue(withIdentifier: "goRecord",sender: nil)
        
    } else {
            //イコールではない場合、前の画面へ戻る。↓参照元
        //<http://appleharikyu.jp/iphone/?p=1074>
        self.dismiss(animated: true, completion: nil)
            
              //インクリメントを実装
            answercount += 1
        
            }
        
        
        // Realm更新
        
       let realm = try! Realm()
       let result = try! Realm().objects(License.self)
>>>>>>> b04bf48299384163c2a1438ef19ce01b41ca0362
        
       try! realm.write {
        
    }
}
