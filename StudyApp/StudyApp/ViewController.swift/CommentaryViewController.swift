//
//  Commentary.swift
//  StudyApp
//
//  Created by airshoh on 2017/10/27.
//  Copyright © 2017年 ShiftPlus+. All rights reserved.
//

import UIKit
import Realm

class CommentaryViewController: UIViewController{

    @IBOutlet weak var correct: UILabel!
    @IBOutlet weak var option: UILabel!
    @IBOutlet weak var comment: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        correct.text = "◯or×"
        option.text = "正解："
        comment.text = "解説文"
        //""←の中にデータベースの中身のパスを入れる？
        
        
    }

}
