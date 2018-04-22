//
//  QuestionViewController.swift
//  StudyApp
//
//  Created by Sasakura Hirofumi on 2017/10/16.
//  Copyright © 2017年 ShiftPlus+. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet weak var noLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var aSelect: UIButton!
    @IBOutlet weak var bSelect: UIButton!
    @IBOutlet weak var cSelect: UIButton!
    @IBOutlet weak var dSelect: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //各種表示の更新
        noLabel.text = String(AppDataController.currentCount + 1) + "問目"
        
        let results = AppDataController.getCurrentQuestionData()
        
        
        questionLabel.text = results.problem
        //複数行に分けて表示する実装
        aSelect.setTitle(results.optionA, for: .normal)
        aSelect.titleLabel!.lineBreakMode = NSLineBreakMode.byWordWrapping
        aSelect.titleLabel!.numberOfLines = 3
        
        bSelect.setTitle(results.optionB, for: .normal)
        bSelect.titleLabel!.lineBreakMode = NSLineBreakMode.byWordWrapping
        bSelect.titleLabel!.numberOfLines = 3
        
        cSelect.setTitle(results.optionC, for: .normal)
        cSelect.titleLabel!.lineBreakMode = NSLineBreakMode.byWordWrapping
        cSelect.titleLabel!.numberOfLines = 3
        
        dSelect.setTitle(results.optionD, for: .normal)
        dSelect.titleLabel!.lineBreakMode = NSLineBreakMode.byWordWrapping
        dSelect.titleLabel?.numberOfLines = 3
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    //次画面への遷移を実行する
    func nextPage() {
//        realmデータをセット
//        AppDataController.createQuestion()
        
        //次画面への遷移
        performSegue(withIdentifier: "goComment",sender: nil)
//        let storyboard: UIStoryboard = self.storyboard!
//        let nextView = storyboard.instantiateViewController(withIdentifier: "answer")
//        self.present(nextView, animated: true, completion: nil)
    }
    
    //Aボタンをタップ
    @IBAction func selectAButton(_ sender: Any) {
        AppDataController.selectAnswer = "A"
        nextPage()
    }
    
    //Bボタンをタップ
    @IBAction func selectBButton(_ sender: Any) {
        AppDataController.selectAnswer = "B"
        nextPage()
        
    }
    
    //Cボタンをタップ
    @IBAction func selectCButton(_ sender: Any) {
        AppDataController.selectAnswer = "C"
        nextPage()
        
    }
    
    //Dボタンをタップ
    @IBAction func selectDButton(_ sender: Any) {
        AppDataController.selectAnswer = "D"
        nextPage()
    }

}
