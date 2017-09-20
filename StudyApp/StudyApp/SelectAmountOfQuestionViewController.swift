//
//  ViewController.swift
//  StudyApp
//
//  Created by 道正裕太 on 2017/08/01.
//  Copyright © 2017年 ShiftPlus+. All rights reserved.
//

import UIKit

class SelectAmountOfQuestionViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet var SelectView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //全問
    @IBOutlet weak var FiveOfAll: UIButton!
    @IBOutlet weak var TenOfAll: UIButton!
    @IBOutlet weak var TwentyOfAll: UIButton!
    @IBOutlet weak var AllOfAll: UIButton!
    
    //未回答
    @IBOutlet weak var FiveOfAllYet: UIButton!
    @IBOutlet weak var TenOfAllYet: UIButton!
    @IBOutlet weak var TwentyOfAllYet: UIButton!
    @IBOutlet weak var AllOfAllYet: UIButton!
    
    //不正解
    @IBOutlet weak var FiveOfAllFalse: UIButton!
    @IBOutlet weak var TenOfAllFalse: UIButton!
    @IBOutlet weak var TwentyOfAllFalse: UIButton!
    @IBOutlet weak var AllOfAllFalse: UIButton!

}

