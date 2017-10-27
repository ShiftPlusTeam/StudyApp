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
        noLabel.text = String(AppDataController.currentCount)
        
        let results = AppDataController.getCurrentQuestionData()
        
        questionLabel.text = results.problem
        aSelect.titleLabel?.text = results.optionA
        bSelect.titleLabel?.text = results.optionB
        cSelect.titleLabel?.text = results.optionC
        dSelect.titleLabel?.text = results.optionD
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    //Aボタンをタップ
    @IBAction func selectAButton(_ sender: Any) {
        AppDataController.selectAnswer = "A"
    }
    
    //Bボタンをタップ
    @IBAction func selectBButton(_ sender: Any) {
        AppDataController.selectAnswer = "B"
        
    }
    
    //Cボタンをタップ
    @IBAction func selectCButton(_ sender: Any) {
        AppDataController.selectAnswer = "C"
        
    }
    
    //Dボタンをタップ
    @IBAction func selectDButton(_ sender: Any) {
        AppDataController.selectAnswer = "D"
        
    }

}
