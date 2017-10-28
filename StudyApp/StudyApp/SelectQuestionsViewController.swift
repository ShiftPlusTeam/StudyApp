//
//  ViewController.swift
//  StudyApp
//
//  Created by 道正裕太 on 2017/08/01.
//  Copyright © 2017年 ShiftPlus+. All rights reserved.
//

import UIKit

class SelectQuestionsViewController: UIViewController {
    
    @IBOutlet var SelectView: UIView!
    
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

/// 枠線付きのボタン
@IBDesignable
public class SK4BorderButton: UIButton {
    
    @IBInspectable var borderWidth: CGFloat = 1.0 {
        didSet {
            layer.borderWidth = borderWidth
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 4.0 {
        didSet {
            layer.cornerRadius = cornerRadius
            setNeedsDisplay()
        }
    }
    
    override public var isEnabled: Bool {
        didSet {
            layer.borderColor = currentTitleColor.cgColor
        }
    }
    
    override public var isHighlighted: Bool {
        didSet {
            let col = currentTitleColor
            let key = "borderColor"
            
            if isHighlighted {
                layer.borderColor = col.withAlphaComponent(0.2).cgColor
                layer.removeAnimation(forKey: key)
                
            } else {
                layer.borderColor = col.cgColor
                let anim = CABasicAnimation(keyPath: key)
                anim.duration = 0.2
                anim.fromValue = col.withAlphaComponent(0.2).cgColor
                anim.toValue = col.cgColor
                layer.add(anim, forKey: key)
            }
        }
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupBorder()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupBorder()
    }
    
    override public func tintColorDidChange() {
        super.tintColorDidChange()
        layer.borderColor = currentTitleColor.cgColor
    }
    
    public func setupBorder() {
        layer.borderWidth = borderWidth
        layer.cornerRadius = cornerRadius
        layer.borderColor = currentTitleColor.cgColor
        clipsToBounds = true
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
