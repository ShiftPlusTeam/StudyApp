//
//  TestImportCsv.swift
//  StudyApp
//
//  Created by 道正裕太 on 2017/10/10.
//  Copyright © 2017年 ShiftPlus+. All rights reserved.
//

import UIKit

class ImportCsvTest: UIViewController, UITableViewDelegate {
    
    
    @IBOutlet weak var `import`: UIButton!
    
    override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
    }
   
    @IBAction func QuestionTest(_ sender: UIButton) {
        print("QuestionTest")
        let mytestImportQuestion = ImportQuestion()
        mytestImportQuestion.QuestionToArray()
    }
    
}
