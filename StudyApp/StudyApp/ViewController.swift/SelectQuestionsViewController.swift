//
//  ViewController.swift
//  StudyApp
//
//  Created by 道正裕太 on 2017/08/01.
//  Copyright © 2017年 ShiftPlus+. All rights reserved.
//

import UIKit

class SelectQuestionsViewController: UIViewController {
    
    //@IBOutlet var SelectView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //次画面への遷移を実行する
    func nextPage() {
        //realmデータをセット
        AppDataController.createQuestion()
        //次画面への遷移
        performSegue(withIdentifier: "goQuestion",sender: nil)
//        let storyboard: UIStoryboard = self.storyboard!
//        let nextView = storyboard.instantiateViewController(withIdentifier: "question")
//        self.present(nextView, animated: true, completion: nil)
    }
    
    
    @IBAction func tapFiveOfAll() {
        AppDataController.count = 5
        AppDataController.kind = "全問"
        nextPage()
    }
    
    @IBAction func tapTenOfAll() {
        AppDataController.count = 10
        AppDataController.kind = "全問"
        nextPage()
    }
    
    @IBAction func tapTwentyOfAll() {
        AppDataController.count = 20
        AppDataController.kind = "全問 "
        nextPage()
    }
    
    @IBAction func tapAllOfAll() {
        AppDataController.count = 100
        AppDataController.kind = "全問"
        nextPage()
    }
    
    @IBAction func tapFiveOfAllYet() {
        AppDataController.count = 5
        AppDataController.kind = "未回答"
        nextPage()
    }
    
    @IBAction func tapTenOfAllYet() {
        AppDataController.count = 10
        AppDataController.kind = "未回答"
        nextPage()
    }
    
    @IBAction func tapTwentyOfAllYet() {
        AppDataController.count = 20
        AppDataController.kind = "未回答"
        nextPage()
    }
    
    @IBAction func tapAllOfAllYet() {
        AppDataController.count = 100
        AppDataController.kind = "未回答"
        nextPage()
    }
    
    @IBAction func tapFiveOfAllFalse() {
        AppDataController.count = 5
        AppDataController.kind = "不正解"
        nextPage()
    }
    
    @IBAction func tapTenOfAllFalse() {
        AppDataController.count = 10
        AppDataController.kind = "不正解"
        nextPage()
    }
    
    @IBAction func tapTwentyOfAllFalse() {
        AppDataController.count = 20
        AppDataController.kind = "不正解"
        nextPage()
    }
    
    @IBAction func tapAllOfAllFalse() {
        AppDataController.count = 100
        AppDataController.kind = "不正解"
        nextPage()
    }

}

@IBDesignable class RoundedButton: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat = 0.0
    @IBInspectable var borderWidth: CGFloat = 0.0
    @IBInspectable var borderColor: UIColor = UIColor.clear
    
    override func draw(_ rect: CGRect) {
        layer.cornerRadius = cornerRadius
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
        clipsToBounds = true
    }
}
