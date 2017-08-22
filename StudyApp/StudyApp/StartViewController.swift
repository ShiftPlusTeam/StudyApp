//
//  StartViewController.swift
//  StudyApp
//
//  Created by 道正裕太 on 2017/08/20.
//  Copyright © 2017年 ShiftPlus+. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        //Dispose of any resources that can be recreated.
    }
    
    //次の画面に遷移する前準備
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //問題文の読み込み
        QuestionDataManager.sharedInstance.loadQuestion()
        
        //遷移画面の呼び出し
        guard let nextViewcontroller = segue.destination as? QuestionViewController else {
            //取得できずに終了
            return
        }
        
        //問題文の取り出し
        guard let questionData = QuestionDataManager.sharedinstance.nextQuestion() else {
            //取得できずに終了
            return
        }
        
        //問題文のセット
        nextViewcontroller.questionData = questionData
    }
    
    //タイトルに戻ったとき
    @IBAction func goToTitle(_ segue: UIStoryboardSegue) {
        
    }


}
