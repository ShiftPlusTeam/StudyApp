//
//  CustomTableViewCell.swift
//  StudyApp
//
//  Created by Sasakura Hirofumi on 2017/11/19.
//  Copyright © 2017年 ShiftPlus+. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    //カスタムセルで定義したオブジェクトを関連づける
    @IBOutlet weak var customLabel: UILabel!
    @IBOutlet weak var customBar: UIProgressView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
