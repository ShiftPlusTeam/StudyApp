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
    
    @IBAction func tapFiveOfAll() {
        AppDataController.count = 5
        AppDataController.kind = "全問"
    }
    
    @IBAction func tapTenOfAll() {
        AppDataController.count = 10
        AppDataController.kind = "全問"
    }
    
    @IBAction func tapTwentyOfAll() {
        AppDataController.count = 20
        AppDataController.kind = "全問 "
    }
    
    @IBAction func tapAllOfAll() {
        AppDataController.count = 100
        AppDataController.kind = "全問"
    }
    
    @IBAction func tapFiveOfAllYet() {
        AppDataController.count = 5
        AppDataController.kind = "未回答"
    }
    
    @IBAction func tapTenOfAllYet() {
        AppDataController.count = 10
        AppDataController.kind = "未回答"
    }
    
    @IBAction func tapTwentyOfAllYet() {
        AppDataController.count = 20
        AppDataController.kind = "未回答"
    }
    
    @IBAction func tapAllOfAllYet() {
        AppDataController.count = 100
        AppDataController.kind = "未回答"
    }
    
    @IBAction func tapFiveOfAllFalse() {
        AppDataController.count = 5
        AppDataController.kind = "不正解"
    }
    
    @IBAction func tapTenOfAllFalse() {
        AppDataController.count = 10
        AppDataController.kind = "不正解"
    }
    
    @IBAction func tapTwentyOfAllFalse() {
        AppDataController.count = 20
        AppDataController.kind = "不正解"
    }
    
    @IBAction func tapAllOfAllFalse() {
        AppDataController.count = 100
        AppDataController.kind = "不正解"
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
