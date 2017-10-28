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
    
    //全問
<<<<<<< HEAD
//    @IBOutlet weak var FiveOfAll: UIButton!
    //@IBOutlet weak var TenOfAll: UIButton!
    //@IBOutlet weak var TwentyOfAll: UIButton!
    //@IBOutlet weak var AllOfAll: UIButton!
=======
    @IBOutlet weak var FiveOfAll: UIButton!
    @IBOutlet weak var TenOfAll: UIButton!
    @IBOutlet weak var TwentyOfAll: UIButton!
    @IBOutlet weak var AllOfAll: UIButton!
>>>>>>> d1cf4d56f987437b6c920c991bc78e9d34dc3e49
    
    //未回答
    //@IBOutlet weak var FiveOfAllYet: UIButton!
    //@IBOutlet weak var TenOfAllYet: UIButton!
    //@IBOutlet weak var TwentyOfAllYet: UIButton!
    //@IBOutlet weak var AllOfAllYet: UIButton!
    
    //不正解
<<<<<<< HEAD
    //@IBOutlet weak var FiveOfAllFalse: UIButton!
    //@IBOutlet weak var TenOfAllFalse: UIButton!
    
    //@IBOutlet weak var TwentyOfAllFalse: UIButton!
    
    //@IBOutlet weak var AllOfAllFalse: UIButton!//  ←ページ作成時にここでエラーが起きる
=======
    @IBOutlet weak var FiveOfAllFalse: UIButton!
    @IBOutlet weak var TenOfAllFalse: UIButton!
    @IBOutlet weak var TwentyOfAllFalse: UIButton!
    @IBOutlet weak var AllOfAllFalse: UIButton!
>>>>>>> d1cf4d56f987437b6c920c991bc78e9d34dc3e49
    
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
