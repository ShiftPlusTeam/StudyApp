//
//  TestImportCsv.swift
//  StudyApp
//
//  Created by 道正裕太 on 2017/10/10.
//  Copyright © 2017年 ShiftPlus+. All rights reserved.
//

import UIKit

class ImportCsvViewController: UIViewController {
    
    override func viewDidLoad() {
    super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    }
   
    @IBAction func ImportTest(_ sender: UIButton) {
        
        print("question.csvの取り込み開始")
        let QuestionTest = ImportQuestion()
        QuestionTest.QuestionToArray()
        //print("question.csvの取り込み完了")
        
        print("license.csvの取り込み開始")
        let LicenseTest = ImportLicense()
        LicenseTest.LicenseToArray()
        //print("license.csvの取り込み完了")
        
    }
    
    @IBAction func UpdateTest(_ sender: UIButton) {
        
        print("question.csvの取り込み開始")
        let QuestionTest = UpdateQuestion()
        QuestionTest.QuestionToArray()
        //print("question.csvの更新完了")
        
//        print("license.csvの取り込み開始")
//        let LicenseTest = UpdateLicense()
//        LicenseTest.LicenseToArray()
//        print("license.csvの更新完了")
        
    }
    
    @IBAction func Reset(_ sender: UIButton) {
        
        let DeleteLicense = RealmControllerLicense()
        DeleteLicense.allDelete()
        
    }
    
}
