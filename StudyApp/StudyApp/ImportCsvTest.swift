//
//  TestImportCsv.swift
//  StudyApp
//
//  Created by 道正裕太 on 2017/10/10.
//  Copyright © 2017年 ShiftPlus+. All rights reserved.
//

import UIKit

class ImportCsvTest: UIViewController {
<<<<<<< HEAD

=======
>>>>>>> d1cf4d56f987437b6c920c991bc78e9d34dc3e49
    
    @IBOutlet weak var `import`: UIButton!
    
    override func viewDidLoad() {
    super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    }
   
    @IBAction func QuestionTest(_ sender: UIButton) {
        print("QuestionTest")
        let mytestImportQuestion = ImportQuestion()
        mytestImportQuestion.QuestionToArray()
    }
    
}
